/* created by: *** 2017/10/2
*/

/* template description
This template creates a new VPC and two subnets under this VPC
*/

/* template specification
TODO
*/

/* examples */

#example 1
#begin creating VPC (showing on console: terraform_fe_demo_router)
resource "openstack_networking_router_v2" "fe_demo_router" {
  name = "terraform_fe_demo_router"
}

#begin creating subnet (showing on console: terraform_fe_demo_subnet_01)
resource "openstack_networking_network_v2" "fe_demo_network_01" {
  name = "terraform_fe_demo_network_01"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "fe_demo_subnet_01" { 
  name = "terraform_fe_demo_subnet_01"
  network_id = "${openstack_networking_network_v2.fe_demo_network_01.id}"
  cidr = "192.168.250.0/24"
  gateway_ip = "192.168.250.1"
  ip_version = 4
}

resource "openstack_networking_router_interface_v2" "fe_demo_router_interface_01" {
  router_id = "${openstack_networking_router_v2.fe_demo_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.fe_demo_subnet_01.id}"
}
#end creating subnet: terraform_fe_demo_subnet_01

#begin creating another subnet (showing on console: terraform_fe_demo_subnet_02)
resource "openstack_networking_network_v2" "fe_demo_network_02" {
  name = "terraform_fe_demo_network_02"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "fe_demo_subnet_02" { 
  name = "terraform_fe_demo_subnet_02"
  network_id = "${openstack_networking_network_v2.fe_demo_network_02.id}"
  cidr = "192.168.251.0/24"
  gateway_ip = "192.168.251.1"
  ip_version = 4
}

resource "openstack_networking_router_interface_v2" "fe_demo_router_interface_02" {
  router_id = "${openstack_networking_router_v2.fe_demo_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.fe_demo_subnet_02.id}"
}
#end creating subnet:terraform_fe_demo_subnet_02
