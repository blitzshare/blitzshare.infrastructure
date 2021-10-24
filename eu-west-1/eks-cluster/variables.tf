variable "domain" {
  type    = string
  default = "blitzshare"
}

variable "state_store_bucket" {
  type    = string
  default = "nate-terraform-state-store"
}

variable "region" {
  default     = "eu-west-1"
  description = "AWS region"
}

variable "prefix" {
  type    = string
  default = "blitzshare"
}
