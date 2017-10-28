output "ids" {
    description = "list of IDs of the created sgs"
    value       = ["${openstack_networking_secgroup_v2.secgroup.*.id}"]
}

