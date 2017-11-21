resource "openstack_networking_port_v2" "port_vip" {
  name           = "${var.project}-port-vip"
  network_id     = "${var.network_id}"
  security_group_ids = ["${var.security_groups}"]
  admin_state_up = "true"
  allowed_address_pairs = [{"ip_address"="1.1.1.1/0"}]
}

resource "openstack_networking_port_v2" "port_master" {
  depends_on  = ["openstack_networking_port_v2.port_vip"]
  name           = "${openstack_networking_port_v2.port_vip.id}"
  network_id     = "${var.network_id}"
  security_group_ids = ["${var.security_groups}"]
  admin_state_up = "true"
  allowed_address_pairs = [{"ip_address"="${openstack_networking_port_v2.port_vip.all_fixed_ips[0]}"}]
}

resource "openstack_networking_port_v2" "port_standby" {
  depends_on  = ["openstack_networking_port_v2.port_vip"]
  name           = "${openstack_networking_port_v2.port_vip.id}"
  network_id     = "${var.network_id}"
  security_group_ids = ["${var.security_groups}"]
  admin_state_up = "true"
  allowed_address_pairs = [{"ip_address"="${openstack_networking_port_v2.port_vip.all_fixed_ips[0]}"}]
}

resource "openstack_compute_instance_v2" "instance_master" {
  depends_on	= ["openstack_networking_port_v2.port_master"]
  name = "${var.project}-server-master"
  image_id = "${var.image_id}"
  flavor_name = "${var.flavor}"
  availability_zone = "${var.az}"
  key_pair = "${var.keypair}"
  security_groups = ["${var.security_groups}"]
  network {
	port = "${openstack_networking_port_v2.port_master.id}"
  }
}

resource "openstack_compute_instance_v2" "instance_standby" {
  depends_on  = ["openstack_networking_port_v2.port_standby"]
  name = "${var.project}-server-standby"
  image_id        = "${var.image_id}"
  flavor_name          = "${var.flavor}"
  availability_zone = "${var.az}"
  key_pair = "${var.keypair}"
  security_groups = ["${var.security_groups}"]
  network {
  port = "${openstack_networking_port_v2.port_standby.id}"
  }
}