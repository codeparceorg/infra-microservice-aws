resource "aws_security_group" "sg_ecs" {

  name        = "sg_ecs"
  description = "Security Group para ECS"
  vpc_id      = module.my_vpc.vpc_id

  tags = {
    vpc = "vpc-${var.environment}"
    name = "sg_ecs",
    env  = "${var.environment}"
  }
}


resource "aws_vpc_security_group_ingress_rule" "ir_ecs_ms_alb" {
  security_group_id = aws_security_group.sg_ecs.id

  depends_on = [ aws_security_group.sg_alb ]

  referenced_security_group_id = aws_security_group.sg_alb.id
  from_port   = 8000
  ip_protocol = "tcp"
  to_port     = 8000
}


resource "aws_vpc_security_group_egress_rule" "er_ecs_all" {
  security_group_id = aws_security_group.sg_ecs.id
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
  cidr_ipv4 = "0.0.0.0/0"
} 