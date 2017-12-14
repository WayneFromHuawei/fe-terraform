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
  security_groups = ["${var.security_group}"]
}

resource "orangecloud_elb_loadbalancer" "loadbalancer_1" {
  type      = "Internal"
  name      = "${var.project}-loadbalancer"
  vpc_id    = "${module.vpc.router_id}"
  
  #this is the network id of attached network(not subnet)
  vip_subnet_id = "${module.vpc.network_id}"
  
  az = "${var.az_a}"
  security_group_id = "${var.security_group}"
 
  timeouts {
    create = "10m"
    update = "8m"
    delete = "5m"
  }
}

resource "orangecloud_elb_listener" "listener_1" {
  name            = "${var.project}-listener"
  loadbalancer_id = "${orangecloud_elb_loadbalancer.loadbalancer_1.id}"
  protocol        = "${var.protocol}"
  protocol_port   = "${var.protocol_port}"

  #If the value of protocol is UDP, the value of this parameter can only be UDP.
  backend_protocol = "${var.backend_protocol}"

  backend_port = "${var.backend_port}"

  #The value can be roundrobin, leastconn, or source.
  lb_algorithm = "${var.lb_algorithm}"

  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }
}

resource "orangecloud_elb_health" "health_1" {
  listener_id = "${orangecloud_elb_listener.listener_1.id}"

  #The value can be HTTP or TCP (case-insensitive).
  healthcheck_protocol = "${var.backend_protocol}"

  healthcheck_uri      = "${var.healthcheck_uri}"
  healthy_threshold    = "${var.healthy_threshold}"
  unhealthy_threshold  = "${var.unhealthy_threshold}"
  healthcheck_timeout  = "${var.healthcheck_timeout}"
  healthcheck_interval = "${var.healthcheck_interval}"

  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }
}

resource "orangecloud_elb_backend" "backend_az_a" {
  listener_id = "${orangecloud_elb_listener.listener_1.id}"

  count     = "${var.instance_count}"
  address   = "${element(module.ecs-az-a.addresses, count.index)}"
  server_id = "${element(module.ecs-az-a.ids, count.index)}"
}
