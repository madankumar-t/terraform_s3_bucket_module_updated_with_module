output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "access_logging_bucket" {
  value = module.s3_bucket.access_logging_bucket
}
