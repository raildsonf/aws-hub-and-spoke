provider "aws" {
  region = var.region
  assume_role {
    role_arn     = var.role_arn
    session_name = "Terraform-CICD"
  }

}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
  required_version = ">= 1.8.1"
}
