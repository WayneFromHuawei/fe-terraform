variable "region" {
    description = "the region to create the ECS"
}

variable "az" {
    description = "the availability zone to create the ECS"
}

variable "name" {
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

variable "metadata1" {
	description = "the metadata to deploy on the server"
	default = "that"
}


variable "network_id" {
    description = "the ID of the network to attach the server to"
}

variable "subnet_id" {
    description = "the ID of the subnet to attach the server to"
}

variable "user_data" {
    description = "the user data to inject"
    default     = ""
}

variable "attach_eip" {
    description = "whether or not to attach en EIP to the server"
    default      = "false"
}

variable "security_groups" {
    type        = "list"
    description = "list of security group ids to attach to the server"
    default     = []
}

variable "ecs_count" {
    description = "number of ECS instances to create"
    default     = "1"
}

variable "diff_hosts_id" {
	type = "list"
	description = "id of instances not to deploy the ECS to the same hosts"
	default = []
}

variable "metadata_this" {
	default = "that"
}

variable "allowed_address_pairs" {
	type="list"
	default=[]
}

variable "ext_net_name" {
    description = "name of the external network (do not change)"
    default     = "admin_external_net"
}