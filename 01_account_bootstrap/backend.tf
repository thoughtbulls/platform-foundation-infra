terraform {
  backend "s3" {
    bucket = "dp-tf-state-763432567385"
    key    = "bootstrap/account/terraform.tfstate"
    region = "ap-south-1"
  }
}
