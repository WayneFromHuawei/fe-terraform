variable "name" {
    description = "naming prefix for created resources"
}

variable "router_id" {
	description = "id of router to attach subnet"
}

variable "subnet" {
    description = "cidr of the desired subnet for the VPC"
}

variable "nameserver" {
    type        = "list"
    description = "nameserver to provide via DHCP"
    default     = ["8.8.8.8", "8.8.4.4"]
}