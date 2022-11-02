variable "subnet_id" {
    description = "The VPC Subnet IDs to launch in"
    type        = string
}

variable "instance_type" {
    description = "The type of instance to start"
    type        = string
}

variable "project_name_prefix" {
    description = "A string value to describe prefix of all the resources"
    type        = string
}

variable "iam_instance_profile" {
    description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
    type        = string
}

variable "key_name" {
    description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
    type        = string
}

variable "disable_api_termination" {
    description = "If true, enables EC2 Instance Termination Protection"
    type        = bool
    default     = true
}

variable "ebs_optimized" {
    description = "If true, the launched EC2 instance will be EBS-optimized"
    type        = bool
}

variable "security_groups" {
    description = "A string value for Security Group ID"
    type        = list(string)
}

variable "common_tags" {
    description = "A mapping of tags to assign to the resource"
    type        = map(string)
}

variable "delete_on_termination" {
    description = "Whether EBS volume will be deleted when instance gets deleted."
    type        = bool
    default     = true
}

variable "encrypted" {
    description = "Whether EBS volume will be encrypted."
    type        = bool
    default     = true
}

variable "volume_type" {
    type    = string
    default = "gp3"
}

variable "root_volume_size" {
    type = number
}

variable "vpc_id" {
    description = "A string value for VPC ID"
    type        = string
}

variable "disable_api_stop" {
    description = "If true, enables EC2 Instance Stop Protection."
    type        = bool
    default     = false
}

variable "source_dest_check" {
    type    = bool
    default = true
}

variable "environment" {
    type    = string
    default = "dev"
}

variable "project" {
    type    = string
    default = "test"
}