resource "databricks_metastore_data_access" "uc_access" {
  metastore_id = module.metastore.metastore_id
  name         = "${var.org_prefix}-${var.platform}-uc-root-access-${var.region}"

  aws_iam_role {
    role_arn = data.terraform_remote_state.account.outputs.uc_runtime_role_arn
  }

  is_default    = false
  force_destroy = true
}


module "storage" {
  source = "../../modules/storage"

  region      = var.region
  metastore_name_prefix = "${var.org_prefix}-${var.platform}-uc-root"
}


module "metastore" {
  source = "../../modules/metastore"

  metastore_name = "${var.org_prefix}-${var.platform}-uc-root-aws-${var.region}"
  storage_root   = "s3://${module.storage.uc_bucket_name}/uc-managed"
  region         = var.region

  providers = {
    databricks = databricks.account
  }
}
