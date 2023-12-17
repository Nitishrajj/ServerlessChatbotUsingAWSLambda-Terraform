#Providing the cloud provider details, here AWS
provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

# Configuring AWS Lambda

#First configure data and role to apply AWS Lambda
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# AWS Role for AWS Lambda
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Creating AWS Lambda
resource "aws_lambda_function" "webex_bot" {
  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  role = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"
  source_code_hash = filebase64sha256("lambda_function.zip")
  runtime       = "python3.9"

}

# Creating AWS API Gateway
resource "aws_api_gateway_rest_api" "bot_api" {
  name        = "ServerlessExample"
  description = "Terraform Serverless Application Example"
}

# Creating AWS API Gateway Resource
resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = "${aws_api_gateway_rest_api.bot_api.id}"
  parent_id   = "${aws_api_gateway_rest_api.bot_api.root_resource_id}"
  path_part   = "{proxy+}"
}

# Creating AWS API Gateway Method
resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = "${aws_api_gateway_rest_api.bot_api.id}"
  resource_id   = "${aws_api_gateway_resource.proxy.id}"
  http_method   = "ANY"
  authorization = "NONE"
}

# Creating AWS API Gateway Integration with Lambda
resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.bot_api.id}"
  resource_id = "${aws_api_gateway_method.proxy.resource_id}"
  http_method = "${aws_api_gateway_method.proxy.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.webex_bot.invoke_arn}"
}

# Creating AWS API Gateway method for the API
resource "aws_api_gateway_method" "proxy_root" {
  rest_api_id   = "${aws_api_gateway_rest_api.bot_api.id}"
  resource_id   = "${aws_api_gateway_rest_api.bot_api.root_resource_id}"
  http_method   = "ANY"
  authorization = "NONE"
}

# Creating AWS API Gateway Integration with Lambda
resource "aws_api_gateway_integration" "lambda_root" {
  rest_api_id = "${aws_api_gateway_rest_api.bot_api.id}"
  resource_id = "${aws_api_gateway_method.proxy_root.resource_id}"
  http_method = "${aws_api_gateway_method.proxy_root.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.webex_bot.invoke_arn}"
}


# Creating AWS API Gateway Deployment for the API
resource "aws_api_gateway_deployment" "deploy" {
  depends_on = [
    "aws_api_gateway_integration.lambda",
    "aws_api_gateway_integration.lambda_root",
  ]

  rest_api_id = "${aws_api_gateway_rest_api.bot_api.id}"
  stage_name  = "test"
}

#Allowing API Gateway to access Lambda
resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.webex_bot.function_name}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${aws_api_gateway_rest_api.bot_api.execution_arn}/*/*"
}


# Taking the module from the modules folder for all the resources ec2, s3 and dynamoDB. 
module "ec2_instance" {
  source = "./modules/ec2-instance"
  ami_value = "ami-87349343" # replace this
  instance_type_value = "t2.micro" # replace this
}

module "s3_bucket" {
  source = "./modules/S3_bucket" # replace this
}

module "dynamoDB_table" {
  source = "./modules/dynamoDB_table" # replace this
  
}


