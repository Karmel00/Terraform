# K8s cluster in AWS EKS managed by Terraform

This project shows a multi-environment AWS infrastructure managed with Terraform.
The infrastructure manages an EKS cluster which deploys micro services: 
- Ngnix as frontend
- FastApi as backend

## Architecture

Cluster has 2 deployments. The FastApi uses Horizontal Pod Autoscaler to scale pods based on cpu usage. liveness and readiness probes manages availability.
ingress route traffic to the Ngnix service which is entry point to the cluster. ingress uses self signed TLS menaged by Kubernetes secret.
The architecture is split into multiple environments to make sure it is stable.
Terraform state is stored in an S3 backend to provide lost of terraform.tfstate
A CI pipeline automatically validates the infrastructure code on each push.

## Modules

Project use Terraform modules:

- **vpc**
  - Define networking resources like: VPC, subnets, and Internet Gateway - local module

- **EKS**
  - Manages nodes by EKS 
  - Define resources like: Worker node instance and ami type, minimum maximum and desired size of worker nodes

## Technologies used

- Kubernetes
- Terraform
- GitHub Actions
- AWS


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
- tls menaged by k8s secret


## What next

On my second branch i am working on CI and adding CD using GitHub Actions
