#CIDR BLOCK
variable "cidr_block" {
  description = "cidr block for main vpc"
  type        = string
}

variable "cidr_block_s1" {
  description = "cidr block for subnet public_1"
  type        = string
}

variable "cidr_block_s2" {
  description = "cidr block for subnet public_2"
  type        = string
}

variable "cidr_block_sp1" {
  description = "cidr block for subnet private_1"
  type        = string
}

variable "cidr_block_sp2" {
  description = "cidr block for subnet private_2"
  type        = string
}

variable "cidr_block_sp3" {
  description = "cidr block for subnet private_3"
  type        = string
}

#availability_zone
variable "az_1a" {
  description = "availability_zone for eu-central-1a"
  type        = string
}

variable "az_1b" {
  description = "availability_zone for eu-central-1b"
  type        = string
}

variable "az_1c" {
  description = "availability_zone for eu-central-1c"
  type        = string
}

variable "env" {
  description = "env tag"
  type        = string
}

