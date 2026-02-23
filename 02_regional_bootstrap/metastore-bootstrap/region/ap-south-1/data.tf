data "terraform_remote_state" "account" {
  backend = "s3"
  config = {
    bucket = "dp-tf-state-763432567385"
    key    = "bootstrap/account/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "metastore" {
  backend = "s3"
  config = {
    bucket = "dp-tf-state-763432567385"
    key    = "bootstrap-metastore/ap-south-1/terraform.tfstate"
    region = "ap-south-1"
  }
}

