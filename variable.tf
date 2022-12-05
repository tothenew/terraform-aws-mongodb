variable "region" {}
variable "secondary_node_type" {}
variable "primary_node_type" {}
variable "vpc_id" {}
variable "mongo_database" {}
variable "mongo_subnet_id" {}
variable "jumpbox_subnet_id" {}
variable "profile" {default = "default"}
variable "jumpbox_instance_type" {default = "t2.nano"}
variable "instance_user" {default = "ubuntu"}
variable "key_name" {default = "mongodb"}
variable "environment" {default = "dev"}
variable "replica_set_name" {default = "mongoRs"}
variable "mongo_username" {default = "admin"}
variable "num_secondary_nodes" {default = 2}
variable "domain_name" {default = ".test.internal"}
variable "ssm_parameter_prefix" {default = "MongoDB"}
variable "custom_domain" { 
  type = bool
  default = false
}