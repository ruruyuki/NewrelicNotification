# 下記リソース(slack)については、terraform importした後、terraform state showで表示したデータを記載する必要がある
# 手順
# 1. terraform import newrelic_notification_destination.slack <destination_id※> (※NewRelic画面のDestinationsで対象Slackの「...」から取得)
# 2. terraform state show newrelic_notification_destination.slack
# 3. 2.で表示された値をresource内に記載する
resource "newrelic_notification_destination" "slack" {
}

# Destinationsの設定(slack以外)
resource "newrelic_notification_destination" "webhook" {
  account_id = var.account_id
  active     = true
  name       = "xxx_webhook"
  type       = "WEBHOOK"

  property {
    key           = "url"
    value         = var.webhook_url
  }
}
