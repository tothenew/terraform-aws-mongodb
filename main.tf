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
}

module "ec2-mongo" {
  source                  = "./modules/ec2-ebs"
  vpc_id                  = var.vpc_id
  ami_id                  = data.aws_ami.amazon-linux-2.id
  key_name                = var.key_name
  instance_type           = var.instance_type
  iam_instance_profile    = var.iam_instance_profile
  security_groups         = var.security_groups
  user_data_script        = file("init.sh")
  subnet_id               = var.subnet_id
  ebs_optimized           = var.ebs_optimized
  disable_api_termination = var.disable_api_termination
  volume_type             = var.volume_type
  root_volume_size        = var.root_volume_size
  tags                    = merge(local.common_tags, tomap({ "Name" : "${local.project_name_prefix}-mongo-db" }))
}