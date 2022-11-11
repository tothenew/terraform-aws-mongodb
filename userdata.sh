#!/bin/bash
# Mongo Version - 4.0/4.2/4.4/5.0
yum update -y

cat << EOF > /etc/yum.repos.d/mongodb-org-${VERSION}.repo
[mongodb-org-${VERSION}]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/${VERSION}/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-${VERSION}.asc
EOF

yum install -y mongodb-org -y
systemctl start mongod
systemctl enable mongod
