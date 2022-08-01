variable "aws-region" {
  type    = string
  default = "ap-south-1"
}

variable "product" {
  type    = string
  default = "connect360"
}

variable "save_private_key" {
  type    = bool
  default = true
}

variable "assume_role_policy" {
  type = string
}

variable "db-username" {
  type = string
}
variable "db-password" {
  type = string
}
variable "db-instance-class" {
  type = string
}