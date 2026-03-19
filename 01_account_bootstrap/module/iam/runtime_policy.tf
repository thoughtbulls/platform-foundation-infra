#############################################################################################
# Storage unity catalog IAM Policy
#############################################################################################
resource "aws_iam_policy" "uc_runtime_policy" {
  name = "${var.org_prefix}-${var.platform}-uc-runtime-policy-${var.region}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = "arn:aws:s3:::${var.org_prefix}-${var.platform}-*-uc-*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:PutObjectAcl",
          "s3:GetBucketLocation"
        ]
        Resource = "arn:aws:s3:::${var.org_prefix}-${var.platform}-*-uc-*/*"
      }
    ]
  })
}


#############################################################################################
# Storage role and policy attachment
#############################################################################################
resource "aws_iam_role_policy_attachment" "runtime_role_attach_policy" {
  role       = aws_iam_role.uc_runtime_role.name
  policy_arn = aws_iam_policy.uc_runtime_policy.arn
}