module "vpc" {
  source  = "..//modules//vpc"
  project = "${var.project}-net"
  subnet  = "${var.subnet_cidr}"
}

module "ecs-az-a" {
  source          = "..//modules//ecs"
  region          = "${var.region}"
  az              = "${var.az_a}"
  ecs_count       = "${var.instance_count}"
  name            = "${var.project}-server"
  image_id        = "${var.image_id}"
  flavor          = "${var.flavor}"
  keypair         = "${var.keypair}"
  network_id      = "${module.vpc.network_id}"
  subnet_id       = "${module.vpc.subnet_id}"
  security_groups = ["${var.security_groups}"]
}

module "ecs-az-b" {
  source          = "..//modules//ecs"
  region          = "${var.region}"
  az              = "${var.az_b}"
  ecs_count       = "${var.instance_count}"
  name            = "${var.project}-server"
  image_id        = "${var.image_id}"
  flavor          = "${var.flavor}"
  keypair         = "${var.keypair}"
  network_id      = "${module.vpc.network_id}"
  subnet_id       = "${module.vpc.subnet_id}"
  security_groups = ["${var.security_groups}"]
}

module "loadbalancer" {
  source 		  = "..//modules//elb-public"
  project		  ="${var.project}-elb"
  vpc_id		  ="${module.vpc.router_id}"
  member_count	  ="${var.instance_count * 2}"
  ids			  =["${concat(module.ecs-az-a.ids,module.ecs-az-b.ids)}"]
  addresses		  =["${concat(module.ecs-az-a.addresses,module.ecs-az-b.addresses)}"]
}