module mongodb {
    source = "../"
    region = "us-east-1"
    primary_node_type = "t2.micro"
    secondary_node_type = "t2.micro"
    vpc_id = "vpc-0c1f5b4a4078b3323"
    mongo_subnet_id = "subnet-0569ea294831bb782"
    jumpbox_subnet_id = "subnet-0b740611c69644d90"
    mongo_database = "admin"
}