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

#availability_zone
variable "az_1a" {
  description = "availability_zone for eu-central-1a"
  type        = string
}

variable "az_1b" {
  description = "availability_zone for eu-central-1b"
  type        = string
}

variable "env" {
  description = "env tag"
  type        = string
}

