data "aws_ami" "amazon-linux-2" {
    most_recent = true
    filter {
      name   = "owner-alias"
      values = ["amazon"]
    }
    filter {
      name   = "name"
      values = ["amzn2-ami-hvm*"]
    }
    owners = ["amazon"]
}

data "template_file" "user_data" {
    template = file("${path.module}/userdata.sh")
}

resource "aws_instance" "ec2" {
	ami                     = data.aws_ami.amazon-linux-2.id
	instance_type           = var.instance_type
	subnet_id               = var.subnet_id
	vpc_security_group_ids  = var.security_groups
	key_name                = var.key_name
	iam_instance_profile    = var.iam_instance_profile
	ebs_optimized           = var.ebs_optimized
	disable_api_termination = var.disable_api_termination
	user_data_base64        = base64encode(data.template_file.user_data.rendered)
	source_dest_check       = var.source_dest_check
    disable_api_stop        = var.disable_api_stop

	volume_tags = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-mongodb" }))
	tags        = merge(var.common_tags, tomap({ "Name" : "${var.project_name_prefix}-mongodb" }))

	root_block_device {
		delete_on_termination = var.delete_on_termination
		encrypted             = var.encrypted
		volume_size           = var.root_volume_size
		volume_type           = var.volume_type
	}

}
