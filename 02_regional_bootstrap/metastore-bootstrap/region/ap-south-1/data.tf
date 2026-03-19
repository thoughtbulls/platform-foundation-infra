data "terraform_remote_state" "account" {
  backend = "s3"
  config = {
    bucket = "thoughtbulls-dp-tf-state-763432567385"
    key    = "platform-foundation-infra/global/account-bootstrap/terraform.tfstate"
    region = "ap-south-1"   # account bootstrap is global — OK
  }
}

data "terraform_remote_state" "metastore" {
  backend = "s3"
  config = {
    bucket = "thoughtbulls-dp-tf-state-763432567385"
    key    = "platform-foundation-infra/ap-south-1/uc-metastore/terraform.tfstate"
    region = "ap-south-1"     #✅ MUST be bucket region
  }
}



