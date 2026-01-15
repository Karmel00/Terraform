#VPC MODULE
variable "cidr_block" {}
variable "cidr_block_s1" {}
variable "cidr_block_s2" {}
variable "cidr_block_sp1" {}
variable "cidr_block_sp2" {}
variable "cidr_block_sp3" {}
variable "az_1a" {}
variable "az_1b" {}
variable "az_1c" {}


#EKS
variable "eks_name" {
  description = "eks cluster name"
}

variable "eks_ami" {
  description = "eks ami type"
}
variable "eks_instance_type" {
  description = "eks instance type"
}
variable "eks_min_size" {
  description = "eks min size"
}
variable "eks_max_size" {
  description = "eks max size"
}
variable "eks_desired_size" {
  description = "eks desired size"
}