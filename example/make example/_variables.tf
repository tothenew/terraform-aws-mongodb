variable "vpc_name" {
  description = "The VPC Subnet IDs to launch in"
  type        = string
  default     = "demorun"	
}
variable "backend_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "terraform-bakcend-demorun"
}
variable "prj_prefix" {
  description = "project_prefix"
  type        = string
  default     = "demorun"
}