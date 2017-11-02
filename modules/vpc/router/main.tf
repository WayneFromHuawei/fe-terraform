resource "openstack_networking_router_v2" "router" {
  name             = "${var.name}-router"
  admin_state_up   = "true"
}