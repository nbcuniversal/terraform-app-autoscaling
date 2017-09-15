variable "ecs_cluster_name" {}

variable "ecs_service_name" {}

variable "ecs_service_arn" {}

variable "ecs_service_min_capacity" {
  default = 4
}

variable "ecs_service_max_capacity" {
  default = 32
}

variable "cpu_high_evaluation_periods" {
  default = 5
}

variable "cpu_high_period_seconds" {
  default = 60
}

variable "cpu_high_statistic_type" {
  default = "Average"
}

variable "cpu_high_threshold" {
  default = 75
}

variable "cpu_low_evaluation_periods" {
  default = 30
}

variable "cpu_low_period_seconds" {
  default = 60
}

variable "cpu_low_threshold" {
  default = 10
}

variable "memory_high_evaluation_periods" {
  default = 5
}

variable "memory_high_period_seconds" {
  default = 60
}

variable "memory_high_statistic_type" {
  default = "Average"
}

variable "memory_high_threshold" {
  default = 75
}

variable "memory_low_evaluation_periods" {
  default = 30
}

variable "memory_low_period_seconds" {
  default = 60
}

variable "memory_low_threshold" {
  default = 10
}

variable "scaling_policy_up_cooldown" {
  default = 300
}

variable "scaling_policy_down_cooldown" {
  default = 600
}
