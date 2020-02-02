data "aws_iam_user" "thiago_caiubi" {
  user_name = "thiago.caiubi"
}

output "thiago_caiubi" {
  value = data.aws_iam_user.thiago_caiubi
}
