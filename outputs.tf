output "database_name" {
  description = "Glue Database name"
  value       = try(module.glue_db.database_name, "")
}
