provider "aws" {
  region = "us-east-1"
}

#Creating dynamoDB_table for lock file as remote backend as a module

resource "aws_dynamodb_table" "terraform_lock" {
    name         = "terraform_lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
  
    attribute {
        name = "LockID"
        type = "S"
}
}
