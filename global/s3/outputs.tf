output "terraform_bucket_state_store_name" {
  description = "s3 bucket name"
  value       = aws_s3_bucket.terraform-state-store.bucket_domain_name
}
