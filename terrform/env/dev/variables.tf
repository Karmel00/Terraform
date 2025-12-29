#VPC MODULE
variable "cidr_block" {}
variable "cidr_block_s1" {}
variable "cidr_block_s2" {}
variable "az_1a" {}
variable "az_1b" {}

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

