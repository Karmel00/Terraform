variable "vpc_id" {
  type = string
}

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

variable "env" {
  description = "env tag"
  type        = string
}