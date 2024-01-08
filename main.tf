data "aws_vpc" "current" {}
resource "aws_codecommit_repository" "repo" {
  #checkov:skip=CKV2_AWS_37: "Ensure Codecommit associates an approval rule" - note required in example
  repository_name = var.resource_prefix
  description     = var.project_prefix
  default_branch  = "main"
  # Tags
  tags = var.tags

}

module "glue_db" {
  # in case you use submodule - you can use only its outputs, also you limited to local and modules from registry
  # second limitation - for some reason assert works for plan but will fail on apply command
  source               = "./submodules/glue_db"
  name                 = var.resource_prefix
  database_description = var.project_prefix
}

module "sg" {
  # you will be  able to test outputs from this module only in plan
  source              = "git::https://github.com/terraform-aws-modules/terraform-aws-security-group//modules/http-80?ref=v5.1.0"
  name                = var.resource_prefix
  description         = var.project_prefix
  vpc_id              = data.aws_vpc.current.id
  ingress_cidr_blocks = ["1.1.1.1/32"]
}
