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

#SECURITY MODULE
variable "sg_ingress" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
}

variable "sg_egress" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
}

