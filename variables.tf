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
