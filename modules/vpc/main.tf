module "router" {
	source = ".//router"
	name = "${var.project}-router"
}

module "subnet" {
	source = ".//subnet"
	name = "${var.project}-subnet"
	router_id = "${module.router.router_id}"
	subnet = "${var.subnet}"
}
