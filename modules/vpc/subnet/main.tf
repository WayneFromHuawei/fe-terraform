resource "openstack_networking_network_v2" "network" {
  name           = "${var.name}-network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name            = "${var.name}-subnet"
  network_id      = "${openstack_networking_network_v2.network.id}"
  cidr            = "${var.subnet}"
  ip_version      = 4
  dns_nameservers = ["${var.nameserver}"]
}

resource "openstack_networking_router_interface_v2" "interface" {
  router_id = "${var.router_id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet.id}"
}

