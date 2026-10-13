# outputs.tf
# output "alb" {
#   value = module.alb
# }

output "alb_dns_name" {
  value = module.alb.dns_name
}

output "listeners_arn" {
  value = module.alb.listeners["http"].arn
}
