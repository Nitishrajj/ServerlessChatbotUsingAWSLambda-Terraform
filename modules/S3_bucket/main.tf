provider "aws" {
  region = "us-east-1"
}

#Creating S3 bucket fo state file to use in remote backend as a module

resource "aws_s3_bucket" "terraform_state_bucket" {
    bucket = "nitish-s3-terraform-demo"
  
}
