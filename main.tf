terraform {
  # We removed the AWS provider requirement to speed up the lab
}

variable "environment_name" {
  description = "The name of the environment (e.g., dev)"
  type        = string
  default     = "dev"
}

# This is a dummy resource that finishes instantly
resource "null_resource" "fast_check" {
  provisioner "local-exec" {
    command = "echo 'Deploying to ${var.environment_name} complete!'"
  }
}