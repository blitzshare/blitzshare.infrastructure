terraform {
  required_version = "= 1.0.9"
  backend "s3" {
    bucket = "eu-west-2-blitzshare-terraform-state-store"
    key    = "eu-west-2/ecr/blitzshare-fileshare-api/terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = var.region
  # allowed_account_ids = ["587813402793"]
}

resource "aws_ecr_repository" "blitzshare_fileshare_api" {
  name                 = "${var.region}-${var.domain}-fileshare-api-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    "deployed" = "terraform",
    "domain"   = var.domain
  }
}