terraform {
  required_version = "= 1.0.9"
  backend "s3" {
    bucket = "blitzshare-terraform-state-store"
    key    = "eu-west-1/s3/fileshare/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
  allowed_account_ids = ["587813402793"]
}

locals {
  tags = {
    "deployed" = "terraform",
    "domain"   = var.prefix
  }
}

resource "aws_s3_bucket" "fileshare_store" {
  bucket = "${var.prefix}-fileshare-store"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = local.tags
}
