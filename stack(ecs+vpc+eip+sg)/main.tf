#a statck to create vpc/ecs/security group and rules using pre-defined modules
module "vpc" {
    source = "..//modules//vpc"
    name   = "${var.project}-net"
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
	security_groups = ["${module.sg_rules.ids}"]
	user_data  = "${var.user_data}"
	metadata_this   = "${var.metadata}"
	diff_hosts_id = ["${var.diff_hosts_id}"]
}

module "sg_rules" {
    source     = "..//modules//sg_rules"
    name       = "${var.project}-sg"
	description = "${var.sg_description}"
	rules_count = "${var.rules_count}"
	rules = ["${var.rules}"]
}