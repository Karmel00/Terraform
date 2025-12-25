# Terraform with a Simple CI Pipeline

This project shows a multi-environment AWS infrastructure managed with Terraform.
The infrastructure is validated using a simple CI pipeline with GitHub Actions.

## Architecture

The architecture is split into multiple environments to make sure it is stable.
Terraform state is stored in an S3 backend to provide lost of terraform.tfstate
A CI pipeline automatically validates the infrastructure code on each push.

## Modules

Project useTerraform modules:

- **vpc**
  - Define networking resources like: VPC, subnets, and Internet Gateway

- **security**
  - Manages Security Groups with inbound and outbound rules

## Technologies used

- Terraform
- GitHub Actions
- AWS


## Code structure
<img width="159" height="474" alt="Zrzut ekranu 2025-12-25 o 10 07 15" src="https://github.com/user-attachments/assets/b8bf2bec-4b97-4aee-90d5-f3e939b9b130" />


## Environments
- dev - development environment 
- prod - environment for production development

## CI - GitHub Actions
pipeline deploy when code is pushed to repo in any branch,
its test the terraform code by:
- terraform init
- terraform fmt
- terraform validate




## Security
- None critical inforamtion in code 
- Used GitHub Secret to manage critical information
- terraform.tfstate stored in s3 

