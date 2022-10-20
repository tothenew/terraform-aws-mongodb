region = "us-east-1"
profile = "default"
key_name = "sparsh-nv"
project="eurokids"
project_name_prefix = "euro-kids"
environment="test"
instance_type = "t2.micro"
iam_instance_profile ="ssm-role"
subnet_id = "subnet-0b45bc874e97793e4"
ebs_optimized = "false"
root_volume_size = "10"
security_groups = [ "sg-0a967f4fa886231f5" ]
vpc_id = "vpc-01f1488876c4a803e"
common_tags = {
    "Feature" : "application"
}
