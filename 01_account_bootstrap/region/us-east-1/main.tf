module "iam" {
  source = "../../module/iam"

  org_prefix                  = var.org_prefix
  platform                    = var.platform
  region                      = var.region
  databricks_account_id       = var.databricks_account_id
  databricks_account_root_arn = var.databricks_account_root_arn
}
