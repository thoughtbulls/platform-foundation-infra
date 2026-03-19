resource "databricks_metastore_data_access" "uc_access" {
  metastore_id = module.metastore.metastore_id
  name         = "uc-root-access-${var.region}"

  aws_iam_role {
    role_arn = data.terraform_remote_state.account.outputs.uc_runtime_role_arn[var.region]
  }

  is_default = false
  force_destroy = true
}

resource "databricks_metastore_data_access" "temp_delete" {
  provider     = databricks.account
  metastore_id = "1addbc5f-4272-42d7-b21a-9e342961d099"
  name         = "uc-root-access-us-east-1"

  aws_iam_role {
    role_arn = data.terraform_remote_state.account.outputs.uc_runtime_role_arn["us-east-1"]
  }

  force_destroy = true
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
