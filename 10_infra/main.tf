# ---------------------------------------------
# Terraform configuration
# ---------------------------------------------
terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # CI では OIDC の環境変数、ローカルでは AWS_PROFILE を利用
  backend "s3" {
    bucket = "tastylog-dev-0912"
    key    = "tastylog-dev.tfstate"
    region = "ap-northeast-1"
  }
}

# ---------------------------------------------
# Provider
# ---------------------------------------------
# profile を固定すると GitHub Actions で失敗するため未指定にする
provider "aws" {
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
