# terraform-aws-mongodb

[![Lint Status](https://github.com/tothenew/terraform-aws-mongodb/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-mongodb/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-mongodb)](https://github.com/tothenew/terraform-aws-mongodb/blob/master/LICENSE)

The following content needed to be created and managed:
 - Introduction
     - Explaination of module 
     - Intended users
 - Resource created and managed by this module
 - Example Usages

<!-- BEGIN_TF_DOCS -->

## Introduction
This repository allows creating MongoDB ReplicaSet in AWS EC2 instances. It includes the following resources:

- Jumpbox Instance: 
    - To access our MongoDB servers
    - To copy replication and cluster configutration files to MongoDB servers
- Primary MongoDB Instance
- Secondary MongoDB Instances (you can define the count of read replicas here. By default, this creates 2 secondary nodes)

## Pre-Requisites
- AWS CLI must be installed and aws-profile must be already created
- AWS VPC must be already configured with min. 2 private subnets, 2 
public subnets, and Nat gateway
    - Public Subnets: Jumpbox is setup here
    - Private Subnets: MongoDB nodes and NAT gateway



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Resources

| Name | Type |
|------|------|
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_ssm_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| secondary\_node\_type | Instance type of Slave MongoDB Nodes | `string` | `t2.micro` | yes |
| primary\_node\_type | Instance type of Master MongoDB Node | `string` | `t2.micro` | yes |
| jumpbox\_instance\_type | Instance type of Bastion Server| `string` | `t2.nano` | yes |
| instance\_user | SSH Username | `string` | `ubuntu` | yes |
| key\_name | pem key file to ssh into servers | `string` | `mongo` | yes |
| vpc\_id | VPC ID where you want to launch your servers | `string` | `NA` | yes |
| environment | Environment Tag Name | `string` | `DEV` | yes |
| mongo\_subnet\_ids | List of Subnet Ids where MongoDB will be running (should be private) | `list` | `NA` | yes |
| jumpbox\_subnet\_ids | Subnet IDs where Bastion Server will be running (should be public) | `list` | `NA` | yes |
| vpc\_cidr\_block | This is for Security Group egress rules | `string` | `0.0.0.0/0` | yes |
| replica\_set\_name | Name of the MongoDB Replicaset which will be created  | `string` | `MongoRs` | yes |
| mongo\_username | MongoDB Username | `string` | `admin` | yes |
| mongo\_database | MongoDB Database | `string` | `admin` | yes |
| num\_secondary\_nodes| Number of Slave MongoDB Nodes | `integer` | `2` | yes |
| custom\_domain | If "true", then the custom domain name will be used for MongoDB else default Private IPs will be used | `bool` | `flase` | yes |
| domain\_name | The custom domain name if required | `string` | `n/a` | yes (only if "custom\_domain" is set to true) |
| ssm\_parameter\_prefix | Prefix for SSM Parameter Key Name | `string` | `MongoDB` | yes |

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-mongodb/blob/main/LICENSE) for full details.

