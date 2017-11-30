output "router_id" {
    description = "the id of the created router"
    value       = "${module.vpc.router_id}"
}

output "network_id" {
    description = "the id of the created network"
    value       = "${module.vpc.network_id}"
}

output "subnet_id" {
    description = "the id of the created subnet"
    value       = "${module.vpc.subnet_id}"
}

output "ecs_ids_az_a" {
	description = "the id of the created evs"
    value       = "${module.ecs-az-a.ids}"
}

output "ecs_ids_az_b" {
	description = "the id of the created evs"
    value       = "${module.ecs-az-b.ids}"
}

output "loadbalancer_id" {
	value = "${orangecloud_elb_loadbalancer.loadbalancer_1.id}"
}