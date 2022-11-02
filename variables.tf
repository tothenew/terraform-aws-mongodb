variable subnet_id {}
variable "instance_type" {}
variable "iam_instance_profile" {}

variable "project_name_prefix" {
    description = "A string value to describe prefix of all the resources"
    type        = string
}
variable "key_name" {}
variable "disable_api_termination" {}
variable "disable_api_stop" {}
variable "ebs_optimized" {}
variable "security_groups" {
	type = list(string)
}
variable "common_tags" {
	type = map(string)
}
variable "source_dest_check" {}
variable "delete_on_termination" {}
variable "encrypted" {}
variable "volume_type" {}
variable "root_volume_size" {}
variable "vpc_id" {}
variable "environment" {
    type    = string
    default = "dev"
}

variable "project" {
    type    = string
    default = "test"
}
