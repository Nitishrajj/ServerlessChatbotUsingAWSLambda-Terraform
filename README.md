# ServerlessChatbotUsingAWSLambda/Terraform


# Infrastrucutre as a Code (IaC)
IaC basically means when a devops engineer wants to automate the process of initializing/killing any cloud services this engineer needs to write code using either AWS CLI/SDK/API Calling. For this the devops engineers need so much of coding knowledge. So IaC came into picture where it uses templates for writing these codes when you send instructions for this using yml/json format files. This is basically called IaC.
There are various IaC tools for various cloud providers like AWS CloudFormation, Azure Resource Manager (ARM), etc. But when you are migrating from one cloud provider to another you need to learn the IaC tool of that provider again. So instead of this we can use Terraform. Terraform uses API to talk with other cloud providers, user should just mention which provider to talk with and what to do in the .tf files. 
Before the advent of IaC, infrastructure management was typically a manual and time-consuming process. System administrators and operations teams had to:

Manually Configure Servers: Servers and other infrastructure components were often set up and configured manually, which could lead to inconsistencies and errors.

Lack of Version Control: Infrastructure configurations were not typically version-controlled, making it difficult to track changes or revert to previous states.

Documentation Heavy: Organizations relied heavily on documentation to record the steps and configurations required for different infrastructure setups. This documentation could become outdated quickly.

Limited Automation: Automation was limited to basic scripting, often lacking the robustness and flexibility offered by modern IaC tools.

Slow Provisioning: Provisioning new resources or environments was a time-consuming process that involved multiple manual steps, leading to delays in project delivery.

IaC addresses these challenges by providing a systematic, automated, and code-driven approach to infrastructure management. Popular IaC tools include Terraform, AWS CloudFormation, Azure Resource Manager templates others.

These tools enable organizations to define, deploy, and manage their infrastructure efficiently and consistently, making it easier to adapt to the dynamic needs of modern applications and services.
# Getting started with Terraform 
Terraform is cloud-agnostic and supports multiple cloud providers, including AWS, Azure, Google Cloud Platform (GCP), and others. This allows users to manage resources across different cloud environments using a single set of configuration files.
Terraform uses API as code
 A provider is a plugin for Terraform that defines and manages resources for a specific cloud or infrastructure platform. Examples of providers include AWS, Azure, Google Cloud, and many others.
A resource is a specific infrastructure component that you want to create and manage using Terraform. Resources can include virtual machines, databases, storage buckets, network components, and more.
A module is a reusable and encapsulated unit of Terraform code. Modules allow you to package infrastructure configurations, making it easier to maintain, share, and reuse them across different parts of your infrastructure
Terraform uses configuration files (often with a .tf extension) to define the desired infrastructure state.
Terraform maintains a state file (often named terraform.tfstate) that keeps track of the current state of your infrastructure.

# Install Terraform 
Windows
Install Terraform from the Downloads Page
(or)
Follow the steps provided in the Downloads Page for Linux.
Linux
Follow the steps provided in the Downloads Page for Linux.
macOS
Follow the steps provided in the Downloads Page for macOS.
Page link - https://developer.hashicorp.com/terraform/install
