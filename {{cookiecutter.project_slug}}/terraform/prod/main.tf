# Placeholder prod stack. It provisions nothing yet — `terraform apply` just prints a
# message. Replace the null_resource with real infrastructure as the project grows.

terraform {
  required_version = ">= 1.5"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = ">= 3.2"
    }
  }
}

resource "null_resource" "deploy_message" {
  provisioner "local-exec" {
    command = "echo 'Deploying {{ cookiecutter.project_name }} to PROD (placeholder — nothing provisioned yet).'"
  }

  # Re-run the message on every apply.
  triggers = {
    always_run = timestamp()
  }
}
