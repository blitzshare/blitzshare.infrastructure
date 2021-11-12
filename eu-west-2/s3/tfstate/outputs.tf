output "bucket_domain_name" {
  description = "s3 bucket name"
  value       = aws_s3_bucket.terraform_state_store.bucket_domain_name
}
