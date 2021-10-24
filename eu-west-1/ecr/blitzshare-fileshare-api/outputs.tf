output "arn" {
  description = "blitzshare_fileshare_api arn"
  value       = aws_ecr_repository.blitzshare_fileshare_api.arn
}

output "name" {
  description = "ecr name"
  value       = aws_ecr_repository.blitzshare_fileshare_api.name
}

output "repository_url" {
  description = "ecr repository_url"
  value       = aws_ecr_repository.blitzshare_fileshare_api.repository_url
}