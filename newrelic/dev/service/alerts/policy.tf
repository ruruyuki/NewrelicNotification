# Policyの作成
resource "newrelic_alert_policy" "policy" {
  name                = "alerts_policy"
  incident_preference = "PER_CONDITION"
}
