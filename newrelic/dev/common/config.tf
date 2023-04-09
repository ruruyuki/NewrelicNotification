terraform {
  required_version = "~> 1.3.7"

  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.12.0"
    }
  }

  # S3バケットは事前に作成しておく
  backend "s3" {
    bucket = "test"
    key    = "newrelic/test/common/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "aws_secretsmanager_secret_version" "apikey" {
  secret_id = "/newrelic-key" # AWS Secrets Managerのシークレットの名前
}

locals {
  secrets = jsondecode(
    data.aws_secretsmanager_secret_version.apikey.secret_string
  )["SecretsKey"] # AWS Secrets Managerのシークレットキー
}

provider "newrelic" {
  # NewRelicのアカウントID
  account_id = var.account_id
  # NewRelicのAPIkeyを設定
  api_key    = local.secrets
  region     = "US"
}

provider "aws" {
  region = "ap-northeast-1"
}


