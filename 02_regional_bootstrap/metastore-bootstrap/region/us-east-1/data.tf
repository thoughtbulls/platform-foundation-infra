data "terraform_remote_state" "account" {
  backend = "s3"
  config = {
    bucket       = "thoughtbulls-dp-tf-state-763432567385"
    key          = "${var.account_state_prefix}/${var.region}/terraform.tfstate"
    region       = var.backend_region # account bootstrap is global — OK
    use_lockfile = true
  }
}