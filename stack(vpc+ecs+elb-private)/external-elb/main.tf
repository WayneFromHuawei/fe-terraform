resource "openstack_networking_network_v2" "network" {
  name           = "${var.project}-network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
    name           = "${var.project}-subnet"
  network_id      = "${openstack_networking_network_v2.network.id}"
  cidr            = "192.168.100.0/24"
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

resource "openstack_networking_router_interface_v2" "interface" {
  router_id = "${orangecloud_networking_router_v2.router.id}"
  subnet_id = "${orangecloud_networking_subnet_v2.subnet.id}"
}

resource "openstack_compute_instance_v2" "webserver-az-a" {
  count = "${var.webserver_num_of_az}
  region = "${var.region}"
    availability_zone = "${var.az1}"
  name            = "terrtest-elb-webserver-a-1129-1"
  image_id      = "${var.image_id}"
  flavor_name     = "t2.micro"
  key_pair    	= "${var.key_pair}"
  
  security_groups = ["${var.security_group}"]

  network {
    uuid = "${openstack_networking_network_v2.network.id}"
  }
  depends_on = ["openstack_networking_network_v2.network","openstack_networking_subnet_v2.subnet"]
}

resource "openstack_compute_instance_v2" "webserver-az-b" {
  count = "${var.webserver_num_of_az}
  region = "${var.region}"
  availability_zone = "${var.az2}"
  name            = "terrtest-elb-webserver-b-1129-1"
  image_id      = "${var.image_id}"
  flavor_name     = "t2.micro"
  key_pair    	= "${var.key_pair}"
  
  security_groups = ["${var.security_group}"]

  network {
    uuid = "${orangecloud_networking_network_v2.network.id}"
  }
  depends_on = ["orangecloud_networking_network_v2.network","orangecloud_networking_subnet_v2.subnet"]
}

resource "orangecloud_elb_loadbalancer" "loadbalancer_1" {
	type = "External"
	name = "terrtest-elb-loadbalancer-1129"
	vpc_id = "${var.router_id}"
	bandwidth = "10"
}

resource "orangecloud_elb_listener" "listener_1" {
  name = "terrtest-elb-listener-1129"
  protocol = "TCP"
  protocol_port = 8080
  backend_protocol = "TCP"
  backend_port = 8080
  lb_algorithm = "roundrobin"
  loadbalancer_id = "${orangecloud_elb_loadbalancer.loadbalancer_1.id}"
  timeouts {
	create = "5m"
	update = "5m"
	delete = "5m"
  }
}

resource "orangecloud_elb_health" "health_1" {
  listener_id = "${orangecloud_elb_listener.listener_1.id}"
  healthcheck_protocol = "HTTP"
  healthy_threshold = 5
  healthcheck_timeout = 15
  healthcheck_interval = 3
  healthcheck_uri = "/"
  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }
}

resource "orangecloud_elb_backend" "backend_1" {
  address = "${var.address_1}"
  listener_id = "${orangecloud_elb_listener.listener_1.id}"
  server_id = "${var.serverid_1}"
}

resource "orangecloud_elb_backend" "backend_2" {
  address = "${var.address_2}"
  listener_id = "${orangecloud_elb_listener.listener_1.id}"
  server_id = "${var.serverid_2}"
}
