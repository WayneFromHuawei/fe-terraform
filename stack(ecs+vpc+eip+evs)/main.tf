module "vpc" {
    source = "..//modules//vpc"
    project   = "${var.project}-net"
    subnet = "${var.subnet_cidr}"
	nameserver = "${var.nameserver}"
}

module "ecs" {
    source     = "..//modules//ecs"
	region	   = "${var.region}"
	az	   	   = "${var.az}"
    ecs_count  = "${var.instance_count}"
    name       = "${var.project}-server"
    image_id   = "${var.image_id}"
    flavor     = "${var.flavor}"
    keypair    = "${var.keypair}"	
    network_id = "${module.vpc.network_id}"
    subnet_id  = "${module.vpc.subnet_id}"
	security_groups = ["${var.security_groups}"]
	user_data  = "${var.user_data}"
	metadata_this   = "${var.metadata}"
	diff_hosts_id = ["${var.diff_hosts_id}"]
}

module "evs" {
	source = "..//modules//evs"
	region = "${var.region}"
	az	   = "${var.az}"
	name = "${var.project}-volume"
	size_in_gb = "${var.disk_size_in_gb}"
	ecs_ids = ["${module.ecs.ids}"]
	evs_count = "${var.instance_count}"
}