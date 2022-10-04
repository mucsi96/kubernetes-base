variable "namespace" {
  type = string
}

variable "image_name" {
  type = string
}

variable "host" {
  type    = string
  default = "spring-boot-admin-server"
}

variable "port" {
  type    = number
  default = 9090
}

