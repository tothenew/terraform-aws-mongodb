variable "region" {
  type = string
}

variable "mongo_ami" {
  type    = string
  default = "ami=0149b2da6ceec4bb0"
}

variable "secondary_node_type" {
  type = string
}

variable "volume_type" {
  type        = string
  description = "EBS volume type"
  default     = "gp3"  
}

variable "volume_size" {
  type        = number
  description = "EBS volume type"
  default     = 50  
}

variable "primary_node_type" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "mongo_database" {
  type = string
}

variable "mongo_subnet_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_user" {
  type    = string
  default = "ubuntu"
}

variable "environment" {
  type    = string
  default = "env"
}

variable "replica_set_name" {
  type    = string
  default = "mongoRs"
}

variable "mongo_username" {
  type    = string
  default = "admin"
}

variable "num_secondary_nodes" {
  type    = string
  default = 2
}

variable "domain_name" {
  type    = string
  default = ".test.internal"
}

variable "ssm_parameter_prefix" {
  type    = string
  default = "MongoDB"
}

variable "custom_domain" {
  type    = bool
  default = false
}

variable "project_name" {
  default = "dummy_prj"
}

