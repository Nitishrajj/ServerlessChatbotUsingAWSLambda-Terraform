terraform {
  backend "s3" {
    bucket = "your-s3-bucket-terraform-demo"
    key = "state_file/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_lock"
  }
}
