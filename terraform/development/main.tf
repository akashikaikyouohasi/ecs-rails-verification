
# Terraformの初期化
terraform {
  # terraformのバージョン指定
  required_version = ">=1.10.5"

  # 使用するAWSプロバイダーのバージョン指定
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.87.0"
    }
  }

  # tfstate(状態管理用ファイル)をS3に保存する設定
  backend "s3" {
    bucket       = "ecs-rails-verification"
    key          = "terraform/ecs-rails-verification.tfstate"
    region       = "ap-northeast-1"
    use_lockfile = true
  }
}
