terraform {
  required_version = "= 1.0.9"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform-state-store" {
  bucket = "blitzshare-terraform-state"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    "deployed" = "terraform",
    "domain" = "blitzshare"
  }
}