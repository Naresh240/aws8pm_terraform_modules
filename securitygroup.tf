locals {
  protocal = "tcp"
  ingress_rules = [{
    port    = 22
    description = "SSH port"
  },
  {
    port    = 80
    description = "HTTP port"    
  },
  {
    port    = 443
    description = "HTTPS port"    
  }]
}

resource "aws_security_group" "main" {
  name     = "allow_ports"

  dynamic "ingress" {
    for_each  = local.ingress_rules

    content {
      description      = ingress.value.description
      from_port        = ingress.value.port
      to_port          = ingress.value.port
      protocol         = local.protocal
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh_security_group"
  }
}