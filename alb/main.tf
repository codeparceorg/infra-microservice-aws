module "alb" {
  source = "terraform-aws-modules/alb/aws"

  name    = "alb-${var.environment}"
  vpc_id  = var.vpc_id
  subnets = var.subnets

  enable_deletion_protection = false


  create_security_group = false
  security_groups       = [var.sg_alb_id]

  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"

      fixed_response = {
        content_type = "text/plain"
        message_body = "ALB activo. No hay microservicios configurados."
        status_code  = "200"
      }
    }
  }

  tags = {
    tf  = "true"
    env = var.environment   
  }
}

