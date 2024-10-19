# Provider
provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "project-x-dev-st"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
