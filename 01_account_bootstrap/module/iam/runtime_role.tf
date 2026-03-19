#############################################################################################
# Storage unity catalog IAM ROLES
#############################################################################################
resource "aws_iam_role" "uc_runtime_role" {
  name = "${var.org_prefix}-${var.platform}-uc-runtime-role-${var.region}"

  lifecycle {
    create_before_destroy = true
  }

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.databricks_account_root_arn
        }
        Action = "sts:AssumeRole"
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.databricks_account_id
          }
        }
      }
    ]
  })
}