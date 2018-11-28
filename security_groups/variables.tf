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

variable consul_security_group_tcp_rules {	
  type = list	
  default = [8300, 8301, 8400, 8500]	
}

variable consul_security_group_rules {	
  type = list(object({	
    from_port = number	
    to_port = number	
    protocol = string	
    cidr_blocks = list(string)	
  }))	
}	
