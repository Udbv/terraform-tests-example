# terraform-tests-example
Repo with hashicorp terraform native tests examples
## Motivation
I failed to find some useful examples, and [documentation](https://developer.hashicorp.com/terraform/language/tests#modules-state) is quite limited
That's why I created this repo to show own findings.
## Prerequisites to run this code
*  installed ``terraform ``. [How-to](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* aws credentials in your env
  * Use env vars or credentials file
## Pros and cons table
| Pros                          | Cons                                                                                           |
|-------------------------------|------------------------------------------------------------------------------------------------|
| Simple onboarding             | Very limited modules support                                                                   |
| You could test simple modules | Complex tests impossible                                                                       |
|                               | No integrations with CI - no outputs in JUnit/sarif/etc formats                                |
|                               | Long run time                                                                                  |
|                               | Not clear which tests succeeded                                                                |
|                               | You cannot to continue tests if one failed                                                     |
|                               | Very limited documentation                                                                     |
|                               | There is no option to skip some required resources from destroy on test cicle(KMS for example) |
## How to run tests
in module root exec
```
terraform test -verbose
```
## Summary
It is fresh functionality which could be useful for small resource modules,
but in this case you probably do not need tests...
So I will suggest to use terratest or other tool at this moment
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_glue_db"></a> [glue\_db](#module\_glue\_db) | ./submodules/glue_db | n/a |
| <a name="module_sg"></a> [sg](#module\_sg) | git::https://github.com/terraform-aws-modules/terraform-aws-security-group//modules/http-80 | v5.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_codecommit_repository.repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codecommit_repository) | resource |
| [aws_vpc.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name to be used on grouped resources | `string` | `null` | no |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Name to be used on all resources as global prefix | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tag blocks. Each element should have keys named key, value, etc. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | Glue Database name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
