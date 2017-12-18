variable "project" {
  description = "naming prefix for created resources"
}

variable "bandwidth" {
  description = "bandwidth of public elb"
  default     = "10"
}

variable "vpc_id" {
  description = "id of vpc to attach loadbanlancer"
}

variable "healthcheck_protocol" {
  description = "the protocol used for the health check.The value can be HTTP or TCP (case-insensitive)."
  default     = "HTTP"
}

variable "healthcheck_connect_port" {
  description = "the port used for the health check,The value ranges from 1 to 65535."
  default     = "80"
}

variable "healthcheck_uri" {
  description = "the URI for health check. This parameter is valid when healthcheck_protocol is HTTP"
  default     = "/"
}

variable "healthy_threshold" {
  description = "the threshold at which the health check result is success,the value ranges from 1 to 10."
  default     = "5"
}

variable "unhealthy_threshold" {
  description = "the threshold at which the health check result is fail,the value ranges from 1 to 10."
  default     = "5"
}

variable "healthcheck_timeout" {
  description = "the maximum timeout duration (s) for the health check,The value ranges from 1 to 50."
  default     = "15"
}

variable "healthcheck_interval" {
  description = "the maximum interval (s) for health check,the value ranges from 1 to 5."
  default     = "3"
}

variable "protocol" {
  description = "the listening protocol used for layer 4 or 7."
  default     = "TCP"
}

variable "protocol_port" {
  description = "the listening port."
  default     = "80"
}

variable "backend_protocol" {
  description = "Specifies the backend protocol. If the value of protocol is UDP,the value of this parameter can only be UDP.The value can be HTTP, TCP, or UDP."
  default     = "TCP"
}

variable "backend_port" {
  description = "backend port"
  default     = "80"
}

variable "lb_algorithm" {
  description = "load balancing algorithm for the listener.The value can be roundrobin, leastconn, or source."
  default     = "roundrobin"
}

variable "member_count" {
  description = "number of members to create"
}

variable "addresses" {
  type        = "list"
  description = "addresses of members to add to the loadbanlancer"
  default     = []
}

variable "ids" {
  type        = "list"
  description = "ids of members to add to the loadbanlancer"
  default     = []
}
