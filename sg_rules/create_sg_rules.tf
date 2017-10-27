resource "openstack_networking_secgroup_v2" "secgroup" {
	name        = "${var.name}-sg"
	description = "${var.description}"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rule" {

	count 			  = "${var.rules_count}"
	
	direction         = "${lookup(var.rules[count.index], "direction")}"
	ethertype         = "${lookup(var.rules[count.index], "ethertype")}"
	protocol          = "${lookup(var.rules[count.index], "protocol")}"
	port_range_min    = "${lookup(var.rules[count.index], "port_range_min")}"
	port_range_max    = "${lookup(var.rules[count.index], "port_range_max")}"
	remote_ip_prefix  = "${lookup(var.rules[count.index], "remote_ip_prefix")}"
	security_group_id = "${openstack_networking_secgroup_v2.secgroup.id}"
}

