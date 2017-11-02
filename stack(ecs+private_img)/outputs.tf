output "addresses" {
    description = "list of ipv4 addresses of the created servers"
    value       = ["${module.ecs.addresses}"]
}

output "ecs_ids" {
    description = "list of IDs of the created servers"
    value       = ["${module.ecs.ids}"]
}

output "count" {
    description = "number of servers created"
    value       = "${module.ecs.count}"
}

output "image_id" {
	description = "id of created image"
    value       = "${module.image.id}"
}