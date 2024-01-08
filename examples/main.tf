module "example" {
  source          = "./../"
  resource_prefix = "example-dev"
  project_prefix  = "example-dev-ci"
  tags = {
    "creator" : "CI",
    "Provisioned" : "ci-tests",
    "Project" : "terraform-ci"
  }
}

output "module" {
  description = "Module output"
  value       = module.example
}
