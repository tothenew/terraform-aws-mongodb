module mongodb {
    source = "../"
    region = "us-east-1"
    primary_node_type = "t2.micro"
    secondary_node_type = "t2.micro"
    vpc_id = "vpc-0c1f5b4a4078b3323"
    mongo_subnet_ids = {
      "us-east-1" = "subnet-0569ea294831bb782"
      "us-east-1" = "subnet-021140f7aa982054a"
    }
    jumpbox_subnet_ids = {
      "us-east-1" = "subnet-0b740611c69644d90"
      "us-east-1" = "subnet-076791df8d148a81a"
    }
    mongo_database = "admin"
}