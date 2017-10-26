# terraform-app-autoscaling

AWS ECS application autoscaling module for Terraform

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ecs_cluster_name |  | string | - | yes |
| ecs_service_arn |  | string | - | yes |
| ecs_service_max_capacity |  | string | `32` | no |
| ecs_service_min_capacity |  | string | `2` | no |
| ecs_service_name |  | string | - | yes |
| high_comparison_operator | A list of available comparison operators can be found here: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-comparisonoperator | string | `GreaterThanOrEqualToThreshold` | no |
| high_evaluation_periods |  | string | `5` | no |
| high_period_seconds |  | string | `60` | no |
| high_statistic_type |  | string | `Average` | no |
| high_threshold |  | string | `75` | no |
| low_comparison_operator | A list of available comparison operators can be found here: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-cw-alarm.html#cfn-cloudwatch-alarms-comparisonoperator | string | `LessThanOrEqualToThreshold` | no |
| low_evaluation_periods |  | string | `30` | no |
| low_period_seconds |  | string | `60` | no |
| low_threshold |  | string | `10` | no |
| metric |  | string | `MemoryUtilization` | no |
| scaling_policy_down_adjustment |  | string | `-1` | no |
| scaling_policy_down_adjustment_type |  | string | `ChangeInCapacity` | no |
| scaling_policy_down_aggregation_type |  | string | `Average` | no |
| scaling_policy_down_cooldown |  | string | `600` | no |
| scaling_policy_up_adjustment |  | string | `1` | no |
| scaling_policy_up_adjustment_type |  | string | `ChangeInCapacity` | no |
| scaling_policy_up_aggregation_type |  | string | `Average` | no |
| scaling_policy_up_cooldown |  | string | `300` | no |
