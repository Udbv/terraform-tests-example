# terraform-tests-example
Repo with hashicorp terraform native tests examples

| Function | Pros | Cons |
|----------|------|------|
|          |      |      |
|          |      |      |
|          |      |      |<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_glue_catalog_database.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_description"></a> [database\_description](#input\_database\_description) | (Optional) Description of the database. | `string` | `"Database created by Terraform"` | no |
| <a name="input_existing_database"></a> [existing\_database](#input\_existing\_database) | Existing database name, if you don't need to create a new database | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all resources as prefix | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_complex_output"></a> [complex\_output](#output\_complex\_output) | n/a |
| <a name="output_database_arn"></a> [database\_arn](#output\_database\_arn) | Glue Database ARN |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | Glue Database name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
