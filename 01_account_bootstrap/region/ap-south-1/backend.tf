terraform {
  backend "s3" {
    bucket         = "thoughtbulls-dp-tf-state-763432567385"
    key            = "platform-foundation-infra/global/account-bootstrap/ap-south-1/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "thoughtbulls-dp-tf-locks"
    encrypt        = true
  }
}