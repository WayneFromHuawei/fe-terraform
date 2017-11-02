output "router_id" {
    description = "the id of the created router"
    value       = "${module.router.router_id}"
}

output "network_id" {
    description = "the id of the created network"
    value       = "${module.subnet.network_id}"
}

output "subnet_id" {
    description = "the id of the created subnet"
    value       = "${module.subnet.subnet_id}"
}

output "interface_port" {
    description = "the port id of the created router interface"
    value       = "${module.subnet.interface_port}"
}

