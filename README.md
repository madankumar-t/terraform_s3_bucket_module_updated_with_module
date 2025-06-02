# Terraform Module: S3 Bucket with Versioning and Access Logging

This Terraform module creates an S3 bucket with versioning enabled and access logging directed to an existing S3 bucket. The access logging bucket is named according to the pattern:

```
dcli-regional-accesslogging-<account-number>-<region-code>
```

Where:
- `<account-number>` is the 12-digit AWS account number.
- `<region-code>` is the 4-character AWS region code (e.g., `usw2`, `use2`, `aps1`, etc.).

## Usage

To use this module, you will need to configure the following files:

### 1. `main.tf`
This file includes the module to create an S3 bucket with versioning and logging.

```hcl
module "s3_bucket" {
  source          = "./modules/s3_bucket_with_versioning_and_logging"
  bucket_name     = var.bucket_name
  account_number  = var.account_number
  region_code     = var.region_code
}
```

### 2. `variables.tf`
Define the variables for the bucket name, AWS account number, and region code.

```hcl
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
```

### 3. `terraform.tfvars`
Define your values for the variables.

```hcl
bucket_name   = "my-unique-bucket-name"
account_number = "123456789012"
region_code    = "usw2"
```

### 4. `output.tf`
This file will output the names of the created S3 bucket and the access logging bucket.

```hcl
output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "access_logging_bucket" {
  value = module.s3_bucket.access_logging_bucket
}
```

### Module Path
Make sure to put the module `s3_bucket_with_versioning_and_logging` in a folder named `modules` relative to your `main.tf`.

```
/modules/s3_bucket_with_versioning_and_logging/
  └── main.tf
```

### Apply the Configuration
Run the following commands to apply the configuration:

```bash
terraform init
terraform apply
```

### Output
After applying the Terraform configuration, the output will include the names of the created S3 bucket and the access logging bucket:

```
bucket_name = "my-unique-bucket-name"
access_logging_bucket = "dcli-regional-accesslogging-123456789012-usw2"
```

## Requirements

- Terraform v0.12 or later.
- AWS provider configured with necessary permissions to create S3 buckets and configure logging.
