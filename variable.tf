variable "region" {
  type    = string
  description = "this is for region"
#   default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-018ba43095ff50d08"
}

variable "instance" {
  type    = string
  default = "t2.micro"
}

variable "keypair" {
  type    = string
  default = "senamekomlaN"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "route_cidr" {
  type    = string
  default = "10.0.0.0/24"
}




