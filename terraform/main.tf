terraform {
  required_version = ">= 1.0"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

resource "null_resource" "demo" {
  triggers = {
    environment = var.environment
  }
}
