output "router_id" {
    description = "the id of the created router"
    value       = "${openstack_networking_router_v2.router.id}"
}

