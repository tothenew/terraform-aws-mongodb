variable subnet_id {}

variable "ami_id" {}

variable "instance_type" {}

variable "iam_instance_profile" {}

variable "user_data_script" {}

variable "key_name" {}

variable "disable_api_termination" {}

variable "ebs_optimized" {}

variable "security_groups" {
	type = list(string)
}

variable "tags" {
	type = map(string)
}

variable "source_dest_check" {
	default = true
}

variable "delete_on_termination" {
	default = true
}

variable "encrypted" {
	default = true
}

variable "volume_type" {
	# default = "gp3"
}

variable "root_volume_size" {
}

# variable "kms_key_id" {
# 	# default = "alias/aws/ebs"
# }





variable "vpc_id" {
  
}