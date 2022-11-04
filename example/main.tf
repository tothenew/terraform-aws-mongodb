
module "ec2-mongo" {
    source                  = "git::https://github.com/tothenew/terraform-aws-mongodb.git"
    vpc_id                  = "vpc-9999xxxxxxxxxxxxx"
    key_name                = "xxxx"
    instance_type           = "t2.micro"
    iam_instance_profile    = "xxxx"
    security_groups         = ["xxxxxxx"]
    subnet_id               = "subnet-9999xxxxx"
    ebs_optimized           = false
    disable_api_termination = true
    disable_api_stop        = true
    delete_on_termination   = true
    source_dest_check       = true
    encrypted               = true
    volume_type             = "gp3"
    root_volume_size        = "10"
    project_name_prefix     = "dev-test"

    common_tags             = {
      "Feature" : "application"
      "Environment" = "dev"
    }
}
