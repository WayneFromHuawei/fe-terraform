module "ecs-master" {
  source          = "..//modules//ecs"
  region          = "${var.region}"
  az              = "${var.az}"
  ecs_count       = "${var.instance_count}"
  name            = "${var.project}-server-master"
  image_id        = "${var.image_id}"
  flavor          = "${var.flavor}"
  keypair         = "${var.keypair}"
  network_id      = "${var.network_id}"
  subnet_id       = "${var.subnet_id}"
  security_groups = ["${var.security_groups}"]

  allowed_address_pairs = [{"ip_address"="${openstack_networking_port_v2.port_vip.all_fixed_ips[0]}"}]
  }]
}

module "ecs-standby" {
  source     = "..//modules//ecs"
  region     = "${var.region}"
  az         = "${var.az}"
  ecs_count  = "${var.instance_count}"
  name       = "${var.project}-server-standy"
  attach_eip = "true"
  image_id   = "${var.image_id}"
  flavor     = "${var.flavor}"
  keypair    = "${var.keypair}"
  network_id = "${var.network_id}"
  subnet_id  = "${var.subnet_id}"
  security_groups = ["${var.security_groups}"]
  
    allowed_address_pairs = [{"ip_address"="${openstack_networking_port_v2.port_vip.all_fixed_ips[0]}"}]
  }]
}

resource "openstack_networking_port_v2" "port_vip" {
  name           = "${var.project}-port-vip"
  network_id     = "${var.network_id}"
  security_group_ids = ["${var.security_groups}"]
  admin_state_up = "true"
  allowed_address_pairs = [{"ip_address"="1.1.1.1/0"}]
}