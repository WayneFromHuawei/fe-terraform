variable "name" {
    description = "name prefix for created resources"
}

variable "description" {
    description = "description of security group"
}

variable "rules_count" {
    description = "number of rules"
}

variable "rules" {
	type = "list"
	description = "definition of rules in a security group"
}



