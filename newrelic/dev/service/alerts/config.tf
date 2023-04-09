terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.12.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.54.0"
    }
  }

  backend "s3" {
    bucket = "test"
    key    = "newrelic/test/service/alerts/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "aws_secretsmanager_secret_version" "apikey" {
  secret_id = "/newrelic-key"
}

locals {
  secrets = jsondecode(
    data.aws_secretsmanager_secret_version.apikey.secret_string
  )["SecretsKey"]
}

provider "newrelic" {
  # Configuration options
  account_id = var.account_id
  api_key    = local.secrets
  region     = "US"
}

provider "aws" {
  region = "ap-northeast-1"
}

data "terraform_remote_state" "common" {
  backend = "s3"

  config = {
    bucket = "test"
    key    = "newrelic/test/common/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
