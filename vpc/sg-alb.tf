resource "aws_security_group" "sg_alb" {

  name        = "sg_alb"
  description = "Security Group para el Load Balancer"
  vpc_id      = module.my_vpc.vpc_id

  tags = {
    vpc = "vpc-${var.environment}"
    name = "sg_alb",
    env  = "${var.environment}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ir_alb_http" {
  security_group_id = aws_security_group.sg_alb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "ir_alb_https" {
  security_group_id = aws_security_group.sg_alb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}


resource "aws_vpc_security_group_egress_rule" "er_alb_all" {
  security_group_id = aws_security_group.sg_alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # Todo el tráfico
}