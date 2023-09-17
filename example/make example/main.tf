module "mongodb" {
  source              = "./terraform-aws-mongodb-1.0.0"
  region              = local.workspace.aws.region
  primary_node_type   = local.workspace.primary_node_type
  secondary_node_type = local.workspace.secondary_node_type
  vpc_id              = local.workspace.vpc_id
  mongo_subnet_id     = local.workspace.mongo_subnet_id
  mongo_database      = local.workspace.mongo_database
  key_name            = local.workspace.key_name
  mongo_ami           = local.workspace.mongo_ami
}