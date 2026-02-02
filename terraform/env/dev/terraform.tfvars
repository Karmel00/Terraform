#VPC
cidr_block     = "10.0.0.0/16"
cidr_block_s1  = "10.0.1.0/24"
cidr_block_s2  = "10.0.2.0/24"
cidr_block_sp1 = "10.0.3.0/24"
cidr_block_sp2 = "10.0.4.0/24"
cidr_block_sp3 = "10.0.5.0/24"
az_1a          = "eu-central-1a"
az_1b          = "eu-central-1b"
az_1c          = "eu-central-1c"

#EKS
eks_name          = "dev-cluster"
eks_ami           = "AL2023_x86_64_STANDARD"
eks_instance_type = "t3.small"
eks_min_size      = 2
eks_max_size      = 4
eks_desired_size  = 2
