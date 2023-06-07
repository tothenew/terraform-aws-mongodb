data "aws_ssm_parameter" "mongodb_endpoint" {
  name = "/${var.environment}/MongoDB/MONGODB_HOST"
}
output "mongodb_ip_address" {
value = split(",", data.aws_ssm_parameter.mongodb_endpoint.value)
}
