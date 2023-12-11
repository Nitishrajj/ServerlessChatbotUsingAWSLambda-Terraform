# ServerlessChatbotUsingAWSLambda-webexbot


# Infrastrucutre as a Code (IaC)
IaC basically means when a devops engineer wants to automate the process of initializing/killing any cloud services this engineer needs to write code using either AWS CLI/SDK/API Calling. For this the devops engineers need so much of coding knowledge. So IaC came into picture where it uses templates for writing these codes when you send instructions for this using yml/json format files. This is basically called IaC.
There are various IaC tools for various cloud providers like AWS CloudFormation, Azure Resource Manager (ARM), etc. But when you are migrating from one cloud provider to another you need to learn the IaC tool of that provider again. So instead of this we can use Terraform. Terraform uses API to talk with other cloud providers, user should just mention which provider to talk with and what to do in the .tf files. 
# Terraform 
Terraform is cloud-agnostic and supports multiple cloud providers, including AWS, Azure, Google Cloud Platform (GCP), and others. This allows users to manage resources across different cloud environments using a single set of configuration files.
Terraform uses API as code
