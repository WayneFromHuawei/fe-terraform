module "ecs" {
    source     = "..//modules//ecs"
	region	   = "${var.region}"
	az	   	   = "${var.az}"
    ecs_count  = "${var.instance_count}"
    name       = "${var.project}-server"
    image_id   = "${var.image_id}"
    flavor     = "${var.flavor}"
    keypair    = "${var.keypair}"	
    network_id = "${var.network_id}"
    subnet_id  = "${var.subnet_id}"
	security_groups = ["${var.security_groups}"]
	user_data  = "${var.user_data}"
	metadata_this   = "${var.metadata}"
	diff_hosts_id = ["${var.diff_hosts_id}"]
}

module "image" {
	source = "..//modules//image"
	region = "${var.region}"
	name = "${var.project}-image"
	#local_file_path = "${var.local_file_path}"
	image_source_url = "${var.image_source_url}"
	container_format = "${var.container_format}"
	min_disk_gb 	 = "${var.min_disk_gb}"
	disk_format 	 = "${var.disk_format}"
	visibility  	 = "${var.visibility}"
}