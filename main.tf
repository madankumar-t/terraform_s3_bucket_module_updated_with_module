module "s3_bucket" {
  source          = "./modules/s3_bucket_with_versioning_and_logging"
  bucket_name     = var.bucket_name
  account_number  = var.account_number
  region_code     = var.region_code
}
