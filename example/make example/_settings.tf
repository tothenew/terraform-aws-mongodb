provider "aws" {
  region  = local.workspace["aws"]["region"]
}

terraform {
  required_version = ">= 1.3.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "4.50"
    }
  }
}

locals {
  env       = yamldecode(file("${path.module}/config.yml"))
  common    = local.env["common"]
  workspace = local.env["workspaces"][terraform.workspace]

  project_name_prefix = "{local.workspace.account_name}-${local.workspace.aws.region}-${local.workspace.project_name}"

  tags = {
    Project     = local.workspace.project_name
  }
}