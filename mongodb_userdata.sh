#!/bin/bash
set -x

exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1

# Installing AWS_CLI
apt-get update
apt install awscli -y 


# Allowing TCP Forwarding form SSH
echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
systemctl restart ssh


# Installing MongoDB and Python with Dependent Packages and Pip
apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common -y
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
apt-get update
apt-get install -y mongodb-org unzip python3-distutils jq build-essential python3-dev
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
rm -f get-pip.py
pip3 install --upgrade awscli
pip3 install boto3

# Configuring mongod.conf File
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
cat >> /etc/mongod.conf <<EOL
security:
  keyFile: /opt/mongodb/keyFile

replication:
  replSetName: ${replica_set_name}
EOL
chown ubuntu:ubuntu /etc/mongod.conf
cat >> /etc/systemd/system/mongod.service <<EOL
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target
EOL
chown ubuntu:ubuntu /etc/systemd/system/mongod.service

# Waiting for primary MongoDB server to come in running state 
aws ec2 wait instance-running  --filters "Name=tag:Type,Values=primary" --region ${aws_region}

# System Settings for MongoDB Replica_Set
PRIMARY_PRIVATE_IP=$(aws ec2 describe-instances --filters "Name=tag:Type,Values=primary" "Name=instance-state-name,Values=running" --region ${aws_region} | jq .Reservations[0].Instances[0].PrivateIpAddress --raw-output)
if [ ${custom_domain} = true ]
then
  echo "$PRIMARY_PRIVATE_IP mongo1${domain_name}" >> /etc/hosts
fi

while [ ! -f /home/ubuntu/populate_hosts_file.py ]
do
  sleep 2
done
while [ ! -f /home/ubuntu/parse_instance_tags.py ]
do
  sleep 2
done
while [ ! -f /home/ubuntu/keyFile ]
do
  sleep 2
done
mkdir -p /opt/mongodb
mv /home/ubuntu/keyFile /opt/mongodb
chown mongodb:mongodb /opt/mongodb/keyFile
chmod 600 /opt/mongodb/keyFile

mv /home/ubuntu/populate_hosts_file.py /populate_hosts_file.py
mv /home/ubuntu/parse_instance_tags.py /parse_instance_tags.py

chmod +x populate_hosts_file.py
chmod +x parse_instance_tags.py

INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id --silent)
MONGO_NODE_TYPE=$(aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=Type" --region ${aws_region} | jq .Tags[0].Value --raw-output)

# Executing python script to setup host and cluster-setup file
aws ec2 describe-instances --filters "Name=tag:Type,Values=secondary" "Name=instance-state-name,Values=running" --region ${aws_region} | jq . | ./populate_hosts_file.py ${replica_set_name} ${mongo_database} ${mongo_username} ${mongo_password} ${domain_name} ${custom_domain} $PRIMARY_PRIVATE_IP $MONGO_NODE_TYPE ${aws_region} ${environment} ${ssm_parameter_prefix}

if [ ${custom_domain} = true ]
then
  HOSTNAME=$(aws ec2 describe-instances --instance-id $INSTANCE_ID --region ${aws_region} | jq . | ./parse_instance_tags.py ${domain_name} ${custom_domain})
  hostnamectl set-hostname $HOSTNAME
fi

systemctl enable mongod.service
systemctl start mongod.service

if [ $MONGO_NODE_TYPE == "primary" ]; 
then
  sleep 60
  mongo ./cluster_setup.js
  sleep 60
  mongo ./user_setup.js
fi

systemctl start mongod.service
