module "alert_condition" {
  source                = "../../../module/conditions"
  policy_id             = newrelic_alert_policy.policy.id
  account_id            = var.account_id
  env                   = var.env
  for_each              = local.condition_setting
  name                  = lookup(each.value, "name")
  query                 = lookup(each.value, "query")
  operator              = lookup(each.value, "operation")
  threshold             = lookup(each.value, "threshold")
  threshold_duration    = lookup(each.value, "threshold_duration")
  threshold_occurrences = lookup(each.value, "threshold_occurrences")
}
