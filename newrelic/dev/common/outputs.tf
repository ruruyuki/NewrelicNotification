output "notification_destination_slack_id" {
  value = newrelic_notification_destination.slack.id
}
output "notification_destination_webhook_id" {
  value = newrelic_notification_destination.webhook.id
}
