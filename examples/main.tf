
module "ec2-mongo" {
    source                  = "../"
    vpc_id                  = "vpc-01f1488876c4a803e"
    key_name                = "sparsh-nv"
    instance_type           = "t2.micro"
    iam_instance_profile    = "ssm-role"
    security_groups         = ["sg-0a967f4fa886231f5"]
    subnet_id               = "subnet-0b45bc874e97793e4"
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
