#############################################################################################
# inputs which require to create resources. they are passed from root module and others
#############################################################################################

variable "databricks_account_id" {

}

variable "databricks_account_root_arn" {}

variable "org_prefix" {
  description = "Organization prefix name (eg. thoughtbulls, tcs, wipro)"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "platform" {
  description = "Platform name (e.g. dp, ml, analytics)"
  type        = string
}

