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

resource "openstack_compute_volume_attach_v2" "volume_attach" {
	count = "${var.instance_count}"
	instance_id = "${element(module.ecs.ids, count.index)}"
	volume_id   = "${var.volume_id}"
}