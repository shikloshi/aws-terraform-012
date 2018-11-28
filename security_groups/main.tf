variable aws_access_key {
  type = string
}

variable aws_secret_key {
  type = string
}

variable aws_region {
  type = string
  default = "us-west-2"
}

provider aws {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}

variable consul_security_group_tcp_rules {
  type = list
  default = [8300, 8301, 8400, 8500]
}

resource aws_default_security_group consul_security_group {
  dynamic "ingress" {
    for_each = var.consul_security_group_tcp_rules
    iterator = rule
    content {
      protocol = "tcp"
      from_port = rule.value
      to_port = rule.value
      cidr_blocks = [ "0.0.0.0/0" ]
    }

  }
}
