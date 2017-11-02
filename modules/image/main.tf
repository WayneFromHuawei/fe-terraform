resource "openstack_images_image_v2" "image" {
	region				= "{$var.region}"
	name   				= "{$var.name}"
	#local_file_path 	= "${var.local_file_path}"
	image_source_url 	= "${var.image_source_url}"
	container_format	= "${var.container_format}"
	min_disk_gb 		= "${var.min_disk_gb}"
	disk_format 		= "${var.disk_format}"
	visibility  		= "${var.visibility}"
}