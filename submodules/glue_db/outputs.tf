output "database_arn" {
  description = "Glue Database ARN"
  value       = try(aws_glue_catalog_database.this[0].arn, "")
}

output "database_name" {
  description = "Glue Database name"
  value       = try(aws_glue_catalog_database.this[0].name, "")
}

output "complex_output" {
  value = aws_glue_catalog_database.this[0]
}
