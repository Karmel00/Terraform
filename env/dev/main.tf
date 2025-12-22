module "vpc" {
  source        = "../../modules/vpc"
  cidr_block    = var.cidr_block
  cidr_block_s1 = var.cidr_block_s1
  cidr_block_s2 = var.cidr_block_s2
  az_1a         = var.az_1a
  az_1b         = var.az_1b
  env           = "dev"
}
