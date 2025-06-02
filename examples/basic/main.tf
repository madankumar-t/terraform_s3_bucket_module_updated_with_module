module "s3_bucket" {
  source          = "../../modules/s3_bucket_with_versioning_and_logging"
  bucket_name     = "my-example-bucket"
  account_number  = "123456789012"
  region_code     = "usw2"
}
