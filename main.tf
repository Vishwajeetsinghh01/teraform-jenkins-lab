terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configures AWS using the credentials from Jenkins
provider "aws" {
  region = "us-east-1"
}

# Defines the variable we will pass from dev.tfvars
variable "environment_name" {
  description = "The name of the environment (e.g., dev)"
  type        = string
}

# A simple resource that just prints a message (Free and Safe)
resource "null_resource" "environment_check" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo 'Deploying to the ${var.environment_name} environment...'"
  }
}