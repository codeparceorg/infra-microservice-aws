module "my_vpc" {
  source = "./vpc" 
  environment = var.environment
}


module "my_alb" {
  source = "./alb"
  vpc_id = module.my_vpc.vpc_id
  subnets = module.my_vpc.subred_public_all
  sg_alb_id = module.my_vpc.sg_alb_id
  environment = var.environment
}

module "my_ecs" {
  source = "./ecs"
   environment = var.environment
   aws_region = var.aws_region
}