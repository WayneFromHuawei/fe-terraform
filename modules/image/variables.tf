variable "region" {
    description = "the region to create the ECS"
}

variable "name" {
    description = "naming prefix for created resources"
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
