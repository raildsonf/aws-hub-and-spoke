terraform {
  backend "s3" {
    bucket         = "__BACKEND_BUCKET__"
    key            = "__ENVIRONMENT__-tfstates/__CI_PROJECT_NAME__/__CI_PROJECT_ID__/__CI_PROJECT_NAME__-terraform.tfstate"
    region         = "__BACKEND_REGION__"
    dynamodb_table = "__LOCK_TABLE__"
    encrypt        = __ENCRYPT__
  }
}