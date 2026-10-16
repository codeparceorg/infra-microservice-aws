module "my_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.environment}"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]

  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  public_subnet_tags = {
    "Type" = "public",
    "env"  = var.environment
  }

  default_route_table_name    = "NN"
  default_security_group_name = "NN"
  default_network_acl_name    = "NN"


  # NACL reglas dedicadas para la subred pública
  public_dedicated_network_acl = true

  public_inbound_acl_rules = [
    {
      "cidr_block" : "0.0.0.0/0",
      "protocol" : "all",
      "rule_action" : "allow",
      "rule_number" : 100,}
 ]

  public_outbound_acl_rules = [
    {
      "cidr_block" : "0.0.0.0/0",
      "protocol" : "all",
      "rule_action" : "allow",
      "rule_number" : 1000,
    }
  ]

  tags = {
    tf  = "true"
    env = var.environment   
  }
}
