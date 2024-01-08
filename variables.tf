variable "resource_prefix" {
  description = "Name to be used on all resources as global prefix"
  type        = string
}

variable "project_prefix" {
  description = "Name to be used on grouped resources"
  type        = string
  default     = null
}


variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = null
}
