resource "flexibleengine_elb_loadbalancer" "loadbalancer_1" {
  type      = "External"
  name      = "${var.project}-lb"
  vpc_id    = "${var.vpc_id}"
  bandwidth = "${var.bandwidth}"
}

resource "flexibleengine_elb_listener" "listener_1" {
  name            = "${var.project}-listener"
  loadbalancer_id = "${flexibleengine_elb_loadbalancer.loadbalancer_1.id}"
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

resource "flexibleengine_elb_health" "health_1" {
  listener_id = "${flexibleengine_elb_listener.listener_1.id}"

  #The value can be HTTP or TCP (case-insensitive).
  healthcheck_protocol = "${var.backend_protocol}"

  healthcheck_connect_port = "${var.healthcheck_connect_port}"
  
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

resource "flexibleengine_elb_backend" "backend_1" {
  listener_id = "${flexibleengine_elb_listener.listener_1.id}"

  count     = "${var.member_count}"
  address   = "${element(var.addresses, count.index)}"
  server_id = "${element(var.ids, count.index)}"
}
