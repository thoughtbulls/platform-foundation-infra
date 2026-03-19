resource "databricks_metastore_data_access" "uc_access" {
  provider     = databricks.account
  metastore_id = data.terraform_remote_state.metastore.outputs.metastore_id
  name         = "uc-root-access-${var.region}"

  aws_iam_role {
    role_arn = data.terraform_remote_state.account.outputs.uc_runtime_role_arn[var.region]
  }

  is_default = true

  lifecycle {
    ignore_changes = [name]
  }
}


module "storage" {
  source = "../../modules/storage"

  region      = var.region
  environment = var.environment
}

module "metastore" {
  source = "../../modules/metastore"

  metastore_name = "${var.metastore_name}-${var.region}"
  storage_root   = "s3://${module.storage.uc_bucket_name}/uc-managed"
  region         = var.region

  providers = {
    databricks = databricks.account
  }
}
