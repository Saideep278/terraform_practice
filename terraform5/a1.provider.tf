# Terraform settings block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 5.0"
      # Uncomment the version line for production-level use
    }
    null = {
      source = "hashicorp/null"
    }
  }
}

# Provider block
provider "aws" {
  region = var.aws_region
}
