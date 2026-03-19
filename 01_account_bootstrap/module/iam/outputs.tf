#############################################################################################
# outputs of created resources which will be used in root outputs and other modules as input
#############################################################################################


output "uc_runtime_role_arn" {
  value = aws_iam_role.uc_runtime_role.arn
}
