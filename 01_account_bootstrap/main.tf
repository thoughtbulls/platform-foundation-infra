module "iam" {
  source = "../02_regional_bootstrap/metastore-bootstrap/modules/iam"

  environment                 = var.environment
  databricks_account_id       = var.databricks_account_id
  databricks_account_root_arn = var.databricks_account_root_arn
}
