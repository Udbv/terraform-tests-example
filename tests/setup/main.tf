# this "submodule" used to generate variables and provision external dependencies if needed.
# inside tests you are not able to compute some vars, only use from run like this
resource "random_pet" "bucket_prefix" {
  length = 4
}
data "aws_caller_identity" "current" {}

variable "resource_prefix" {
  type = string
}
output "bucket_prefix" {
  value = random_pet.bucket_prefix.id
}
output "resource_prefix" {
  value = "some-nice-prefix"
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "database_arn" {
  value = "arn:aws:glue:eu-central-1:${data.aws_caller_identity.current.account_id}:database/${var.resource_prefix}"
}
