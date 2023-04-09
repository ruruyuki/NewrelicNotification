locals {
  # 各condition別の設定
  condition_setting = {
    # ALB
    httpCodeElb5XXCount = {
      "name"                  = "ALB-httpCodeElb5XXCount-condition"
      "query"                 = "SELECT sum(`provider.httpCodeElb5XXCount.Sum`) FROM LoadBalancerSample WHERE provider='Alb' AND `entityGuid` = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'"
      "operation"             = "above_or_equals"
      "threshold"             = 10
      "threshold_duration"    = 60
      "threshold_occurrences" = "at_least_once"
    },
    # ECS
    v1PointAddCPUUtilization = {
      "name"                  = "ECS-CPUUtilization-condition}"
      "query"                 = "SELECT max(`aws.ecs.CPUUtilization.byService`) FROM Metric WHERE aws.ecs.ClusterName = 'xxx-cluster' AND aws.ecs.ServiceName = 'xxx-service'"
      "operation"             = "above_or_equals"
      "threshold"             = 80
      "threshold_duration"    = 3600
      "threshold_occurrences" = "at_least_once"
    },
  }
}
