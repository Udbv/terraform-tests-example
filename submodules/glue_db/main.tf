resource "aws_glue_catalog_database" "this" {
  count = var.existing_database != "" ? 0 : 1

  name        = var.name
  description = var.database_description
}
