output "addresses-master" {
  description = "list of ipv4 addresses of the created servers"
  value       = ["${module.ecs-master.addresses}"]
}

output "addresses-standby" {
  description = "list of ipv4 addresses of the created servers"
  value       = ["${module.ecs-standby.addresses}"]
}
