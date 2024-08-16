#terrafrom setting block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 5.0"
      # required in production level
    }
  }
}



# provider block
provider "aws" {
  region = "us-east-1"
}
