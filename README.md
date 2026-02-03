# K8s cluster in AWS EKS managed by Terraform

This project shows how to create and manage an AWS EKS cluster with Terraform.  
The cluster runs two microservices:

- **Nginx** as frontend  
- **FastAPI** as backend  

## Architecture

- The backend uses a Horizontal Pod Autoscaler to scale pods based on CPU usage.  
- Liveness and readiness probes make sure services stay available.  
- Traffic goes through an **Ingress**, which routes to Nginx. TLS is handled with a Kubernetes secret.  
- The project is split into multiple environments for stability.  
- Terraform state is stored in an **S3 bucket**.  

## Terraform modules

- **VPC** – sets up networking: VPC, subnets, Internet Gateway.  
- **EKS** – sets up cluster nodes, including node type and scaling settings.  

## Technologies

- Kubernetes  
- Terraform  
- AWS  
- GitHub Actions  

## Environments

- **dev** – development environment  
- **prod** – production environment  

## CI/CD

- CI GitHub Actions automatically checks the code on every push:  
  - `terraform`  - using build in tools
  - `Kubernetes` - manifest are check with Kubeconform (open sorce manifest validation tool)
-  CD GitHub Actions automatically deploy changes on pushing to main:

    - `AWS` - infrastucture changes by terraform
    - `Kubernetes`- cluster changes deploy to EKS

## Security

- Secrets are stored in GitHub Secrets or Kubernetes secrets.  
- No sensitive information is stored in the repo.
