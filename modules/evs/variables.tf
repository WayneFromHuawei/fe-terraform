variable "region" {
    description = "region name to create EVS volume"
}

variable "az" {
    description = "az name to create EVS volume"
}

variable "name" {
    description = "naming prefix for created resources"
}

variable "size_in_gb" {
    description = "size of the volume in GByte"
}

variable "ecs_ids" {
    type        = "list"
    description = "list of IDs from ECS to attach the volumes to"
}

variable "evs_count" {
    description = "number of volumes to create"
    default     = "1"
}