################################################################################
# Glue Database
################################################################################

variable "name" {
  description = "Name to be used on all resources as prefix"
  type        = string
  default     = null
}


variable "existing_database" {
  description = "Existing database name, if you don't need to create a new database"
  type        = string
  default     = ""
}

variable "database_description" {
  description = "(Optional) Description of the database."
  type        = string
  default     = "Database created by Terraform"
}
