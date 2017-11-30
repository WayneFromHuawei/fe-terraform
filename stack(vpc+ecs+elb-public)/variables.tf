variable "region" {
    description = "the region to create the ECS"
}

variable "az_a" {
    description = "the availability zone to create the ECS"
}

variable "az_b" {
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
	default = "192.168.100.0/24"
}

variable "nameserver" {
    type        = "list"
    description = "nameserver to provide via DHCP"
    default     = ["8.8.8.8", "8.8.4.4"]
}

variable "security_groups" {
    type        = "list"
    description = "list of security group ids to attach to the server"
    default     = ["1d52c37c-e27f-422a-b508-f00f2f25fe0a"]
}

variable "healthcheck_protocol" {
    description = "the protocol used for the health check.The value can be HTTP or TCP (case-insensitive)."
	default = "HTTP"
}

variable "healthcheck_uri" {
    description = "cidr of the desired subnet for the VPC"
	default = "/"
}
variable "healthy_threshold" {
    description = "cidr of the desired subnet for the VPC"
	default = "5"
}

variable "unhealthy_threshold" {
    description = "cidr of the desired subnet for the VPC"
	default = "5"
}

variable "healthcheck_timeout" {
    description = "cidr of the desired subnet for the VPC"
	default = "15"
}

variable "healthcheck_interval" {
    description = "cidr of the desired subnet for the VPC"
	default = "3"
}

variable "bandwidth" {
    description = "bandwidth of public elb"
	default = "10"
}

variable "protocol" {
	description = "the listening protocol used for layer 4 or 7."
	default = "TCP"
}

variable "protocol_port" {
    description = "the listening port."
	default = "80"
}

variable "backend_protocol" {
    description = "Specifies the backend protocol. If the value of protocol is UDP,the value of this parameter can only be UDP.The value can be HTTP, TCP, or UDP."
	default = "TCP"
}
variable "backend_port" {
    description = "backend port"
	default = "80"
}
variable "lb_algorithm" {
    description = "load balancing algorithm for the listener.The value can be roundrobin, leastconn, or source."
	default = "roundrobin"
}
