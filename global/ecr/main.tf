provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "blitzshare_fileshare_api" {
  name                 = "${var.prefix}-fileshare-api-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    "deployed" = "terraform",
    "domain"   = var.prefix
  }
}