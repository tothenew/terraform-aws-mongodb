variable "region" {}
variable "mongo_ami" { default = ami-0149b2da6ceec4bb0 }
variable "secondary_node_type" { default = "t2.micro"  }
variable "primary_node_type" { default = "t2.micro"  }
variable "vpc_id" {}
variable "mongo_database" {}
variable "mongo_subnet_id" {}
variable "key_name" { default = "mongodb"  }
variable "instance_user" { default = "ubuntu" }
variable "environment" { default = "env" }
variable "replica_set_name" { default = "mongoRs" }
variable "mongo_username" { default = "admin" }
variable "num_secondary_nodes" { default = 2 }
variable "domain_name" { default = ".test.internal" }
variable "ssm_parameter_prefix" { default = "MongoDB" }
variable "custom_domain" {
  type    = bool
  default = false
}
variable "project_name" {default ="dummy_prj"}


