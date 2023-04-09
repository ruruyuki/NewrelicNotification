# Destinations設定
# 通知を行うサービス(slack)の設定
resource "newrelic_notification_channel" "slack" {
  account_id     = var.account_id
  name           = "notice_slack_alert"
  type           = "SLACK"
  destination_id = data.terraform_remote_state.common.outputs.notification_destination_slack_id
  product        = "IINT"

  property {
    key   = "channelId"
    value = var.channelId
  }
}

# 通知を行う任意のサービスの設定(slackでないもの)
resource "newrelic_notification_channel" "webhook" {
  account_id     = var.account_id
  name           = "notice_webhook_alert"
  type           = "WEBHOOK"
  destination_id = data.terraform_remote_state.common.outputs.notification_destination_webhook_id
  product        = "IINT"

  property {
    key   = "payload"
    value = <<-EOT
      {}
      EOT
  }
}
