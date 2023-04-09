# workflowの作成
resource "newrelic_workflow" "workflow_alerts" {
  name                  = "alerts-workflow"
  account_id            = var.account_id
  enrichments_enabled   = false
  enabled               = true
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "test_filter"
    type = "FILTER"

    predicate {
      attribute = "state"
      operator  = "DOES_NOT_CONTAIN"
      values    = ["CLOSED"]
    }

    predicate {
      # valuesで指定したポリシーでアラートがでた時通知する
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      # policy.tfで作成したポリシー
      values    = [newrelic_alert_policy.policy.id]
    }
  }
    destination {
      # notification_channelで作成したslackのid
      channel_id = newrelic_notification_channel.slack.id
    }
    # notification_channelで作成したwebhook(任意のサービス)のid
    destination {
      channel_id = newrelic_notification_channel.webhook.id
    }
}
