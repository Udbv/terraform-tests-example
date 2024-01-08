  variables {
    resource_prefix = "udbv-dev"
    project_prefix  = "udbv-dev-ci" # used for project wide purposes
    tags            = {
      "creator" : "CI",
      "Provisioned" : "ci-tests",
      "Project" : "terraform-ci"
    }
  }

run "setup_tests" {
  module {
    source = "./tests/setup" # Runs the setup code to generate our expected outputs, actually it runs apply
  }
}


run "glue_database" {
  command = plan # much faster than apply, assert
  assert {
    condition     = module.glue_db.database_name == "udbv-dev"
    error_message = "glue database name did not match expected"
  }
}
#run "glue_database_arn" {
#  command = plan # much faster than apply
#  # will fail if you try to assert value which known only after apply
#  assert {
#    condition     = module.glue_db.database_arn == "example-dev"
#    error_message = "glue database name did not match expected"
#  }
#}

run "glue_database_arn_apply" {
  assert {
    condition     = module.glue_db.database_arn == run.setup_tests.database_arn # you can use only outputs from setup run as computed vars for assert
    error_message = "glue database arn did not match expected"
  }
  assert {
    condition     = module.glue_db.database_arn == "arn:aws:glue:eu-central-1:${run.setup_tests.account_id}:database/${var.resource_prefix}" # you can use vars and outputs from setup run as computed vars for assert
    error_message = "glue database arn did not match expected"
  }
  # in resource you are able to reference resource attributes
  assert {
    condition     = aws_codecommit_repository.repo.description == var.project_prefix # you can use hardcoded vars for assert
    error_message = "glue database arn did not match expected"
  }
}
run "remote_module_will_success" {
  command = plan
  assert {
    condition     = module.sg.security_group_description == var.project_prefix
    # you cannot use git cloned modules(not from registry), but plan works
    error_message = "sg description did not match expected"
  }
}
run "overrided_vars" {
  command = plan
    variables {
    project_prefix = "overrided"
  }
  assert {
    condition     = module.sg.security_group_description == var.project_prefix # you cannot use git cloned modules(not from registry), but plan works
    error_message = "sg description did not match expected"
  }

}
#run "remote_module_will_fail" {
#  assert {
#    condition     = module.sg.security_group_description == var.project_prefix # you cannot use git cloned modules output(not from registry) on apply
#    error_message = "sg description did not match expected"
#  }
#
#}
