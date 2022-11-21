variable "region" {}
variable "profile" {
  default =   
}
variable "secondary_node_type" {}
variable "primary_node_type" {
  default = "t2.nano"
}
variable "jumpbox_instance_type" {}
variable "instance_user" {
  default = "ubuntu"
}
variable "key_name" {
  default = "mongodb"
}
variable "vpc_id" {}
variable "mongo_subnet_ids" {type = map}
variable "jumpbox_subnet_ids" {type = map}
variable "vpc_cidr_block" {
  default = "0.0.0.0/0"
}
variable "environment" {
  default = "dev"
}
variable "replica_set_name" {
  default = "mongoRs"
}
variable "mongo_username" {
  default = "admin"
}
variable "mongo_database" {}
variable "num_secondary_nodes" {
  default = 2
}
variable "custom_domain" { 
  type = bool 
  default = false
}
variable "domain_name" { 
  default = ".test.internal" 
}
variable "ssm_parameter_prefix" {
  default = "MongoDB"
}
