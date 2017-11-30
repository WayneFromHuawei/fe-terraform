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

output "network_id" {
    description = "the id of the created network"
    value       = "${module.vpc.network_id}"
}

output "subnet_id" {
    description = "the id of the created subnet"
    value       = "${module.vpc.subnet_id}"
}

output "evs_ids" {
	description = "the id of the created evs"
    value       = "${module.evs.ids}"
}