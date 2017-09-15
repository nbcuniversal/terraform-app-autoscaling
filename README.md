# terraform-app-autoscaling

AWS ECS application autoscaling module for Terraform


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cpu_high_evaluation_periods |  | string | `5` | no |
| cpu_high_period_seconds |  | string | `60` | no |
| cpu_high_statistic_type |  | string | `Average` | no |
| cpu_high_threshold |  | string | `75` | no |
| cpu_low_evaluation_periods |  | string | `30` | no |
| cpu_low_period_seconds |  | string | `60` | no |
| cpu_low_threshold |  | string | `10` | no |
| ecs_cluster_name |  | string | - | yes |
| ecs_service_arn |  | string | - | yes |
| ecs_service_max_capacity |  | string | `32` | no |
| ecs_service_min_capacity |  | string | `4` | no |
| ecs_service_name |  | string | - | yes |
| memory_high_evaluation_periods |  | string | `5` | no |
| memory_high_period_seconds |  | string | `60` | no |
| memory_high_statistic_type |  | string | `Average` | no |
| memory_high_threshold |  | string | `75` | no |
| memory_low_evaluation_periods |  | string | `30` | no |
| memory_low_period_seconds |  | string | `60` | no |
| memory_low_threshold |  | string | `10` | no |
| scaling_policy_down_cooldown |  | string | `600` | no |
| scaling_policy_up_cooldown |  | string | `300` | no |
