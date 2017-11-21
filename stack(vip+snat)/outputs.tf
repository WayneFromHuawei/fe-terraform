output "addresses-master" {
  description = "list of ipv4 addresses of the created servers"
  value       = ["${openstack_compute_instance_v2.instance_master.*.access_ip_v4}"]
}

output "addresses-standby" {
  description = "list of ipv4 addresses of the created servers"
  value       =  ["${openstack_compute_instance_v2.instance_standby.*.access_ip_v4}"]
}

output "addresses-vip" {
  description = "list of ipv4 addresses of the created servers"
  value       =  ["${openstack_networking_port_v2.port_vip.all_fixed_ips}"]
}
