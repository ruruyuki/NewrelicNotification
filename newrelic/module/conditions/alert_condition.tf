resource "newrelic_nrql_alert_condition" "app_log_alert" {
  account_id                   = var.account_id
  policy_id                    = var.policy_id
  name                         = var.name
  type                         = "static"
  enabled                      = true
  fill_option                  = "none"
  violation_time_limit_seconds = 3600
  aggregation_window           = 60
  aggregation_method           = "event_timer"
  aggregation_timer            = 5

  nrql {
    query = var.query
  }
  critical {
    operator              = var.operator
    threshold             = var.threshold
    threshold_duration    = var.threshold_duration
    threshold_occurrences = var.threshold_occurrences
  }
}
