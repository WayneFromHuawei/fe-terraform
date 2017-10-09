/* created by: *** 2017/10/2
*/

/* template description
This template creates a new EVS volume and attach it to an ECS
*/

/* template specification
#create a volume
resource "openstack_blockstorage_volume_v2" "volume_1" {
	#For a full list of supported regions, refer to http://......
	region      = "<region_name>"
	
	name        = "<volume_name>"
	description = "<description>"
	size        = <volume_size> #Gigabytes
	
	#For a full list of supported AZs, refer to http://......
	availability_zone = "<availability_zone>"
	
	#supported volume type to clarify
	volume_type = "<volume_type>" 

	#source id to create the volume
	#Image to boot from, for a full list supported image, refer to http://......
	image_id = "<image_id>" 
	
	snapshot_id = "<snapshot_id>"
	source_vol_id = "<source_vol_id >"
}

#attach a volume to ECS
resource "openstack_compute_volume_attach_v2" "attachments" {
  instance_id = "<ecs_instance_id>"
  volume_id   = "<volume_id>"
}

*/

/* examples */
#example 1: create one volume and attach to an ECS
resource "openstack_blockstorage_volume_v2" "fe_demo_vol_01" {
  name = "terraform_fe_demo_vol_00"
  availability_zone = "eu-west-0a"
  size = 40
}

resource "openstack_compute_volume_attach_v2" "attachments" {
  instance_id = "a43fbeeb-1bcf-4b38-b7b0-da69ae850cd8"
  volume_id   = "${openstack_blockstorage_volume_v2.fe_demo_vol_01.id}"
}

#example 2: create three volumes at batch and attach them to an ECS
resource "openstack_blockstorage_volume_v2" "fe_demo_vol_02" {
  name = "${format("terraform_fe_demo_vol_01_%02d", count.index + 1)}"
  count=3
  availability_zone = "eu-west-0a"
  size = 40
}

resource "openstack_compute_volume_attach_v2" "attachments" {
  count       = 3
  instance_id = "a43fbeeb-1bcf-4b38-b7b0-da69ae850cd8"
  volume_id   = "${element(openstack_blockstorage_volume_v2.fe_demo_vol_02.*.id, count.index)}"
}

