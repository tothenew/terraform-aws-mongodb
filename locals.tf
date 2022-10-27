locals {
  project_name_prefix = "${var.environment}-${var.project_name_prefix}"
  common_tags = merge(
    var.common_tags,
    tomap({
      "Project"     = var.project,
      "Environment" = var.environment
    })
  )
}