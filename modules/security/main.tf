resource "aws_security_group" "main" {
    vpc_id =  var.vpc_id
    dynamic "ingress" {
      for_each = var.sg_ingress
      content {
        from_port = ingress.value.internal
        to_port =  ingress.value.external
        protocol = ingress.value.protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

      dynamic "egress" {
    for_each = var.sg_egress
    content {
      from_port = egress.value.internal
      to_port =  egress.value.external
      protocol = egress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
      }
      }
      
       tags = {
    Name = "${var.env}-sg"
    Env  = var.env
  }
}