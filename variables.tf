variable "ecs_cluster_name" {}

variable "ecs_service_name" {}

variable "ecs_service_arn" {}

variable "ecs_service_min_capacity" {
  default = 2
}

variable "ecs_service_max_capacity" {
  default = 32
}

variable "high_comparison_operator" {
  default     = "GreaterThanOrEqualToThreshold"
  description = "A list of available comparison operators can be found here: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-comparisonoperator"
}

variable "high_evaluation_periods" {
  default = 5
}

variable "high_period_seconds" {
  default = 60
}

variable "high_statistic_type" {
  default = "Average"
}

variable "high_threshold" {
  default = 75
}

variable "low_comparison_operator" {
  default     = "LessThanOrEqualToThreshold"
  description = "A list of available comparison operators can be found here: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-comparisonoperator"
}

variable "low_evaluation_periods" {
  default = 30
}

variable "low_period_seconds" {
  default = 60
}

variable "low_threshold" {
  default = 10
}

variable "scaling_policy_up_adjustment_type" {
  default = "ChangeInCapacity"
}

variable "scaling_policy_up_cooldown" {
  default = 300
}

variable "scaling_policy_up_aggregation_type" {
  default = "Average"
}

variable "scaling_policy_up_adjustment" {
  default = 1
}

variable "scaling_policy_down_adjustment_type" {
  default = "ChangeInCapacity"
}

variable "scaling_policy_down_cooldown" {
  default = 600
}

variable "scaling_policy_down_aggregation_type" {
  default = "Average"
}

variable "scaling_policy_down_adjustment" {
  default = -1
}

variable "metric" {
  default = "MemoryUtilization"
}
