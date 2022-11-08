# terraform-aws-mongodb

## Usage

```
module "ec2-mongodb" {
    source                    = "git::https://github.com/tothenew/terraform-aws-mongodb.git"
    key_name                  = "key_name"
    iam_instance_profile      = "test-role"
    security_groups           = ["sg-999999999999"]
    subnet_id                 = "subnet-999999999999"
    project_name_prefix       = "dev-tothenew"
    common_tags               = {
      "Project"     = "ToTheNew",
      "Environment" = "dev"
    }
}
```

<!--- BEGIN_TF_DOCS --->

<!--- END_TF_DOCS --->
