resource "openstack_compute_instance_v2" "instance" {
	region 	  	= "${var.region}"
	availability_zone = "${var.az}"
	count       = "${var.ecs_count}"
	name        = "${var.name}${format("%02d", count.index+1)}"
	image_id  = "${var.image_id}"
	flavor_name = "${var.flavor}"
	key_pair    = "${var.keypair}"
	user_data   = "${var.user_data}"
	metadata {
		this = "${var.metadata_this}"
	}
	
	scheduler_hints {
		different_host = ["${var.diff_hosts_id}"]
	}
	
	network {
		port = "${element(openstack_networking_port_v2.network_port.*.id, count.index)}"
		access_network = true
	}
}

resource "openstack_networking_port_v2" "network_port" {
	count              = "${var.ecs_count}"
	network_id     	 = "${var.network_id}"
	security_group_ids = ["${var.security_groups}"]
	admin_state_up     = "true"
	allowed_address_pairs = ["${var.allowed_address_pairs}"]
	fixed_ip           = {
		subnet_id      = "${var.subnet_id}"
  }
}

resource "openstack_networking_floatingip_v2" "fip" {
  count    = "${var.attach_eip == "true" ? var.ecs_count : 0}"
  pool     = "${var.ext_net_name}"
  port_id  = "${element(openstack_networking_port_v2.network_port.*.id, count.index)}"
  depends_on = ["openstack_compute_instance_v2.instance"]
}

