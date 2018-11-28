resource aws_default_security_group consul_security_group_tcp {
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

resource aws_default_security_group consul_security_group {
  dynamic "ingress" {
    for_each = var.consul_security_group_rules
    iterator = rule
    content {
      protocol = rule.value.protocol
      from_port = rule.value.from_port
      to_port = rule.value.to_port
      cidr_blocks = rule.value.cidr_blocks
    }
  }
}
