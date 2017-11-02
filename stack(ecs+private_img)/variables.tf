variable "region" {
    description = "the region to create the ECS"
}

variable "az" {
    description = "the availability zone to create the ECS"
}

variable "project" {
    description = "naming prefix for created resources"
}

variable "image_id" {
    description = "id of the image to use for the server"
}

variable "flavor" {
    description = "name of the flavor to use for the server"
}

variable "keypair" {
    description = "the keypair to deploy on the server"
}

variable "metadata" {
	description = "the metadata to deploy on the server"
	default = "that"
}

variable "network_id" {
	description = "the network_id to attach the server"
}

variable "subnet_id" {
	description = "the subnet_id to attach the server"
}

variable "security_groups" {
	type="list"
	description = "the security_groups to deploy to the server"
}

variable "user_data" {
    description = "the user data to inject"
    default     = ""
}

variable "attach_eip" {
    description = "whether or not to attach en EIP to the server"
    default      = "false"
}

variable "instance_count" {
    description = "number of ECS instances to create"
    default     = "1"
}

variable "diff_hosts_id" {
	type = "list"
	description = "id of instances not to deploy the ECS to the same hosts"
	default = []
}

variable "local_file_path" {
    description = "filepath of the raw image file that will be uploaded to OBS. Conflicts with image_source_url"
	default=""
}

variable "image_source_url" {
    description = "url of the raw image that will be uploaded to OBS"
	default=""
}

variable "container_format" {
    description = "The container format. Must be one of 'ami', 'ari', 'aki', 'bare', 'ovf'"
}

variable "min_disk_gb" {
	description = "Amount of disk space (in GB) required to boot image"
}

variable "disk_format" {
    description = "The disk format. Must be one of 'ami', 'ari', 'aki', 'vhd', 'vmdk', 'raw', 'qcow2', 'vdi', 'iso'."
}

variable "visibility" {
    description = "The visibility of the image. Must be one of 'public', 'private', 'community', or 'shared'."
}

