output "addresses" {
  description = "list of ipv4 addresses of the created servers"
  value       = ["${module.ecs-internal.addresses}"]
}
