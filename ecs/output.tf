# outputs.tf
# output "cluster" {
#   value = module.ecs
# }

output "cluster_id" {
  value = module.ecs.cluster_id
}

output "cluster_name" {
  value = module.ecs.cluster_name
}
