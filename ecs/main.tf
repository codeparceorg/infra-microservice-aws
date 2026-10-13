module "ecs" {
  source = "terraform-aws-modules/ecs/aws"
  region = var.aws_region

  cluster_name = "ecs-cluster-${var.environment}"

  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = "/aws/ecs/${var.environment}"
      }
    }
  }

  # Cluster capacity providers
  cluster_capacity_providers = ["FARGATE"]
  
  default_capacity_provider_strategy = {
    FARGATE = {
      weight = 50
      base   = 20
    }
  }

  tags = {
    tf  = "true"
    env = var.environment   
  }
}
