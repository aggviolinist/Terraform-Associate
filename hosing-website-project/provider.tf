terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

provider "aws" {
  # Region of the bucket
  region = "us-east-1"
}