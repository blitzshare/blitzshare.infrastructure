variable "domain" {
  type    = string
  default = "blitzshare"
}

variable "region" {
  default     = "eu-west-2"
  description = "AWS region"
}

variable "prefix" {
  type    = string
  default = "blitzshare"
}
