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

variable "subnet_cidr" {
    description = "cidr of the desired subnet for the VPC"
}

variable "nameserver" {
    type        = "list"
    description = "nameserver to provide via DHCP"
    default     = ["8.8.8.8", "8.8.4.4"]
}

variable "security_groups" {
    type        = "list"
    description = "list of security group ids to attach to the server"
    default     = []
}

variable "volume_id" {
    description = "id of the volume to attach to ecs"
}
