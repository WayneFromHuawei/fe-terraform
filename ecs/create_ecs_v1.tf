/* created by: *** 2017/10/2 
parameters which users need to specify are enclosed in angle brackets, for example: <para_name>
*/

/* template description
create an ECS with existed VPC and subnet 
create an EVS volume and attach it to the ECS
set ECS booting from this volume
*/

/* template specification
resource "openstack_compute_instance_v2" "<TerrRes_Unique_instance_name>" {
	
	#For a full list supported regions, refer to http://......
	region 			= "<region_name>"
	name            = "<instance_name>"
	
	#Image to boot from, for a full list supported image, refer to http://......
	image_id        = "<image_id>"
	image_name      = "<image_name>"
	
	#Flavour of ECS,for a full list supported flavour, refer to http://......
	flavor_id       = "<flavor_id>"
	flavor_name     = "<flavor_name>"
	
	#For a full list supported AZs, refer to http://......
	availability_zone = "<availability_zone>"
	
	key_pair        = "<key_pair_name>"
	
	security_groups = ["<security_group_name1>,..."]
	
	#network which the ECS connects
	network {
	
		uuid = "<subnet_id>"
		name = "<subnet_name>"
		port = ""
		
		#fixed ip address of this network 
		fixed_ip_v4 = "<specified_ipv4_addr>"
		fixed_ip_v6 = "<specified_ipv6_addr>"
		
		#(Optional) Specifies if this network should be used for provisioning access. Accepts true or false. Defaults to false
		access_network = ""
	}
	
	block_device {
	
		#Must be one of "blank", "image", "volume", or "snapshot". 
		source_type = "<type>"
		
		#Id of source which source_type specifies
		uuid 		= "<id>"
		
		volume_size = "<size>"
		
		boot_index = "<index>"
		
		destination_type = ""
		
		delete_on_termination = ""
	}	

}
*/

/* examples */
#example 1: create an ECS with a boot-able volume of commonIO implicitly
resource "openstack_compute_instance_v2" "fe_demo_ecs_00" {
  name = "terraform_fe_demo_ecs_00"
  image_id = "ab30dd89-ca93-4e0d-b23d-75fecdea8e4e"
  flavor_name = "t2.micro"
  availability_zone = "eu-west-0b"
  key_pair = "KeyPair-wanwei-ocb"
  security_groups = ["sg-wanwei-demoi"]

  network {
    uuid = "f4cbc3a7-560e-4d1c-a14b-7c78553261b4"
  }
}

#example 2: create an ECS with a boot-able volume of commonIO implicitly
resource "openstack_compute_instance_v2" "fe_demo_ecs_01" {
  name = "terraform_fe_demo_ecs_01"
  flavor_name = "t2.micro"
  availability_zone = "eu-west-0a"
  key_pair = "KeyPair-wanwei-ocb"
  security_groups = ["sg-wanwei-demoi"]

  block_device {
    uuid                  = "ab30dd89-ca93-4e0d-b23d-75fecdea8e4e"
    source_type           = "image"
	destination_type      = "volume"
	volume_size 		  = 40
    boot_index            = 0
    delete_on_termination = true
  }
  
  network {
    uuid = "ad243e67-40ec-41a7-9bcc-9f6e9c94fce2"  #id of subnet
	name = "WANWEI_Subnet_APITest1"
  }
}

#example 3: create an ECS with a boot-able volume of commonIO explicitly
resource "openstack_blockstorage_volume_v2" "boot_vol_02" {
  name     = "terraform_fe_demo_vol_02"
  size     = 40
  availability_zone = "eu-west-0a"
  image_id = "ab30dd89-ca93-4e0d-b23d-75fecdea8e4e"
}

resource "openstack_compute_instance_v2" "fe_demo_ecs_02" {
  name        = "terraform_fe_demo_ecs_02"
  flavor_name = "t2.micro"
  availability_zone = "eu-west-0a"
  key_pair = "KeyPair-wanwei-ocb"
  security_groups = ["sg-wanwei-demoi"] 

  block_device {
    uuid                  = "${openstack_blockstorage_volume_v2.boot_vol_02.id}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    uuid = "ad243e67-40ec-41a7-9bcc-9f6e9c94fce2"  #id of subnet
	name = "WANWEI_Subnet_APITest1" #name of subnet
  }
}
