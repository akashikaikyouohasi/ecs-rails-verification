data "aws_iam_policy_document" "github_oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::206863353204:oidc-provider/token.actions.githubusercontent.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:akashikaikyouohasi/ecs-rails-verification:*"]
    }
  }
}

resource "aws_iam_role" "github_actions_terraform_plan_role" {
  name               = "GitHubActions_Terraform_AWS_terraform_plan"
  assume_role_policy = data.aws_iam_policy_document.github_oidc_assume_role_policy.json
}

resource "aws_iam_role_policy" "github_oidc_policy" {
  name = "GitHubActions_Terraform_AWS_terraform_plan_policy"
  role = aws_iam_role.github_actions_terraform_plan_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::ecs-rails-verification",
          "arn:aws:s3:::ecs-rails-verification/*"
        ]
      }
    ]
  })
}

# ReadOnly policyをroleにアタッチ
resource "aws_iam_role_policy_attachment" "github_actions_terraform_plan_policy_attachment" {
  role       = aws_iam_role.github_actions_terraform_plan_role.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}