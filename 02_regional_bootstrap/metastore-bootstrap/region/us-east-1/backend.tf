terraform {
  backend "s3" {
    bucket = "dp-tf-state-763432567385"
    key    = "bootstrap-metastore/us-east-1/terraform.tfstate" # replace the region us-east-1 if you want other region
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
