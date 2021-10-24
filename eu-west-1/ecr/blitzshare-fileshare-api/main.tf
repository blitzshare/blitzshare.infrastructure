terraform {
  required_version = "= 1.0.9"
  backend "s3" {
    bucket = "blitzshare-terraform-state-store"
    key    = "eu-west-1/ecr/blitzshare-fileshare-api/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "blitzshare_fileshare_api" {
  name                 = "${var.domain}-fileshare-api-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    "deployed" = "terraform",
    "domain"   = var.domain
  }
}