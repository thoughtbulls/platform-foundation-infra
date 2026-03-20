terraform {
  backend "s3" {
    bucket         = "thoughtbulls-dp-tf-state-763432567385"
    key            = "platform-foundation-infra/regional/ap-south-1/uc-metastore/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "thoughtbulls-dp-tf-locks"
    encrypt        = true
  }
}