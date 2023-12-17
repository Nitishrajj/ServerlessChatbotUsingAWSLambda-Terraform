provider "aws" {
  region = "us-east-1"
}

#Creating EC2 instance using modules

resource "aws_instance" "example2" {
    ami           = "ami-0230bd60aa48260c6"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
}