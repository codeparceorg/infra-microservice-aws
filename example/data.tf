data "terraform_remote_state" "infra_ecs" {
  backend = "s3"

  config = {
    bucket = "codeparce"
    key    = "devsu/infra-microservice-aws/test_terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_iam_role" "role_exec" {
  name = "ecsTaskExecutionRole"
}