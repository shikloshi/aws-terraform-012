consul_security_group_rules = [
  // web ui
  {
    from_port = 8500
    to_port = 8500
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0"]
  },
  // lan gossip
  {
    from_port = 8301
    to_port = 8301
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ] // should be privdte subnet cidrs
  },
  // wan gossip
  {
    from_port = 8302
    to_port = 8302
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ] // should be privdte subnet cidrs
  },
]
