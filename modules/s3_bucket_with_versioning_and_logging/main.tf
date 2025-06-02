variable "bucket_name" {
  description = "The name of the S3 bucket to create"
  type        = string
}

variable "account_number" {
  description = "The 12 digit AWS account number"
  type        = string
}

variable "region_code" {
  description = "The 4 digit AWS region code (e.g., usw2, use2, aps1, sae1)"
  type        = string
}

# Calculate access logging bucket name
locals {
  access_logging_bucket = "dcli-regional-accesslogging-${var.account_number}-${var.region_code}"
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  logging {
    target_bucket = local.access_logging_bucket
    target_prefix = "logs/"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.bucket
  status = "Enabled"
}

output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "access_logging_bucket" {
  value = local.access_logging_bucket
}
