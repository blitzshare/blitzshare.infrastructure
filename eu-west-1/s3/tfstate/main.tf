terraform {
  required_version = "= 1.0.9"
}

provider "aws" {
  region = var.region
}

locals {
  tags = {
    "deployed" = "terraform",
    "domain"   = var.domain
  }
}

resource "aws_s3_bucket" "terraform_state_store" {
  bucket = "${var.domain}-terraform-state-store"
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
  tags = local.tags
}