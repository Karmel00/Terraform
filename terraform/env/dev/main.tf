module "vpc" {
  source        = "../../modules/vpc"
  cidr_block    = var.cidr_block
  cidr_block_s1 = var.cidr_block_s1
  cidr_block_s2 = var.cidr_block_s2
  cidr_block_sp1 = var.cidr_block_sp1
  cidr_block_sp2 = var.cidr_block_sp2
  cidr_block_sp3 = var.cidr_block_sp3
  az_1a         = var.az_1a
  az_1b         = var.az_1b
  az_1c         = var.az_1c
  env           = "dev"
}

module "security" {
  source     = "../../modules/security"
  vpc_id     = module.vpc.vpc_id
  sg_ingress = var.sg_ingress
  sg_egress  = var.sg_egress
  env        = "dev"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "dev-cluster"
  kubernetes_version = "1.33"
# TO DO: add metics server for hpa
  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
  }

  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  vpc_id                   = module.vpc.vpc_id  
  subnet_ids               = module.vpc.private_subnet_ids
  control_plane_subnet_ids = [module.vpc.private_subnet_ids[0], module.vpc.private_subnet_ids[1]]

  eks_managed_node_groups = {
    workers = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.small"]

      min_size     = 2
      max_size     = 4
      desired_size = 2
    }
  }
    
    tags = {
    Name = "dev-RT"
    Env  = "dev"
  }
  
}

