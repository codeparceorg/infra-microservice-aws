module "my_target_group" {
  source = "./targetgroup"

  repository_name = "devsu-demo-devops-java"
  environment = "test"
  port        = 8000
  health_check_path = "/api/users"
  path_pattern =  ["/api/users", "/api/users/*"]

  vpc_id      = data.terraform_remote_state.infra_ecs.outputs.vpc.vpc_id
  listener_arn = data.terraform_remote_state.infra_ecs.outputs.alb.listeners_arn
}


module "my_task_definition" {
  source = "./taskdefinition"
  cluster_id = data.terraform_remote_state.infra_ecs.outputs.ecs.cluster_id
  execution_role_arn= data.aws_iam_role.role_exec.arn
  vpc_id      = data.terraform_remote_state.infra_ecs.outputs.vpc.vpc_id
  sg_ecs_id = data.terraform_remote_state.infra_ecs.outputs.vpc.sg_ecs_id
  subnets = data.terraform_remote_state.infra_ecs.outputs.vpc.subred_public_all

  environment = "test"
  port        = 8000
  repository_name = "devsu-demo-devops-java"
  image_name = "codeparce/devsu-demo-devops-java:a89955da5f5f1d1935ac22e485575ed6d70a9488"
  target_group_arn = module.my_target_group.target_group_arn
}

