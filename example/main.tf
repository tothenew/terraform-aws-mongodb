module "ec2-mongodb" {
    source                    = "git::https://github.com/tothenew/terraform-aws-mongodb.git"
    key_name                  = "tothenew"
    iam_instance_profile      = "tothenew"
    security_groups           = ["sg-999999999999"]
    subnet_id                 = "subnet-999999999999"
    project_name_prefix       = "dev-tothenew"
    mongo_version             = "4.4" 
    common_tags               = {
      "Project"     = "ToTheNew",
      "Environment" = "dev"
    }
}
