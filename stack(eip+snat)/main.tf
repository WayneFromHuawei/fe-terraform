module "ecs-internal" {
  source          = "..//modules//ecs"
  region          = "${var.region}"
  az              = "${var.az}"
  ecs_count       = "${var.instance_count}"
  name            = "${var.project}-server-noeip"
  image_id        = "${var.image_id}"
  flavor          = "${var.flavor}"
  keypair         = "${var.keypair}"
  network_id      = "${var.network_id1}"
  subnet_id       = "${var.subnet_id1}"
  security_groups = ["${var.security_groups}"]

  allowed_address_pairs = [{
    "ip_address" = "1.1.1.1/0"
  }]
}

module "ecs-bastion" {
  source     = "..//modules//ecs"
  region     = "${var.region}"
  az         = "${var.az}"
  ecs_count  = "${var.instance_count}"
  name       = "${var.project}-server-eip"
  attach_eip = "true"
  image_id   = "${var.image_id}"
  flavor     = "${var.flavor}"
  keypair    = "${var.keypair}"

  /*ecs-internal and ecs-bastion can be put in the same subnet,and it's the same situation
     	if they are not*/
  network_id = "${var.network_id2}"

  subnet_id       = "${var.subnet_id2}"
  security_groups = ["${var.security_groups}"]
}

resource "openstack_networking_router_route_v2" "router_route" {
  router_id        = "${var.router_id}"
  destination_cidr = "0.0.0.0/0"
  next_hop         = "${module.ecs-bastion.addresses[0]}"
}
