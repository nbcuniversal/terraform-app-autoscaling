resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${uuid()}"
  comparison_operator = "${var.cpu_high_comparison_operator}"
  evaluation_periods  = "${var.cpu_high_evaluation_periods}"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "${var.cpu_high_period_seconds}"
  statistic           = "${var.cpu_high_statistic_type}"
  threshold           = "${var.cpu_high_threshold}"

  dimensions {
    ClusterName = "${var.ecs_cluster_name}"
    ServiceName = "${var.ecs_service_name}"
  }

  alarm_actions = ["${aws_appautoscaling_policy.service_up.arn}"]

  lifecycle {
    ignore_changes = ["alarm_name"]
  }

  depends_on = [
    "aws_appautoscaling_target.main",
    "aws_iam_role_policy.cloudwatch"
  ]
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${uuid()}"
  comparison_operator = "${var.cpu_low_comparison_operator}"
  evaluation_periods  = "${var.cpu_low_evaluation_periods}"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "${var.cpu_low_period_seconds}"
  statistic           = "Average"
  threshold           = "${var.cpu_low_threshold}"

  dimensions {
    ClusterName = "${var.ecs_cluster_name}"
    ServiceName = "${var.ecs_service_name}"
  }

  alarm_actions = ["${aws_appautoscaling_policy.service_down.arn}"]

  lifecycle {
    ignore_changes = ["alarm_name"]
  }

  depends_on = [
    "aws_appautoscaling_target.main",
    "aws_iam_role_policy.cloudwatch"
  ]
}

resource "aws_appautoscaling_target" "main" {
  service_namespace  = "ecs"
  resource_id        = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  role_arn           = "${aws_iam_role.autoscaling.arn}"
  min_capacity       = "${var.ecs_service_min_capacity}"
  max_capacity       = "${var.ecs_service_max_capacity}"

  depends_on = [
    "aws_iam_role.autoscaling",
    "aws_iam_role_policy.cloudwatch"
  ]
}

resource "aws_appautoscaling_policy" "service_up" {
  name                    = "${uuid()}"
  service_namespace       = "ecs"
  resource_id             = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  scalable_dimension      = "ecs:service:DesiredCount"
  adjustment_type         = "${var.scaling_policy_up_adjustment_type}"
  cooldown                = "${var.scaling_policy_up_cooldown}"
  metric_aggregation_type = "${var.scaling_policy_up_aggregation_type}"

  step_adjustment {
    metric_interval_lower_bound = 0
    scaling_adjustment          = "${var.scaling_policy_up_adjustment}"
  }

  depends_on = [
    "aws_appautoscaling_target.main",
    "aws_iam_role_policy.cloudwatch"
  ]

  lifecycle {
    ignore_changes = [
      "name",
    ]
  }
}

resource "aws_appautoscaling_policy" "service_down" {
  name                    = "${uuid()}"
  service_namespace       = "ecs"
  resource_id             = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  scalable_dimension      = "ecs:service:DesiredCount"
  adjustment_type         = "${var.scaling_policy_down_adjustment_type}"
  cooldown                = "${var.scaling_policy_down_cooldown}"
  metric_aggregation_type = "${var.scaling_policy_down_aggregation_type}"

  step_adjustment {
    metric_interval_lower_bound = 0
    scaling_adjustment          = "${var.scaling_policy_down_adjustment}"
  }

  depends_on = [
    "aws_appautoscaling_target.main",
    "aws_iam_role_policy.cloudwatch"
  ]

  lifecycle {
    ignore_changes = [
      "name",
    ]
  }
}

resource "aws_iam_role" "autoscaling" {
  assume_role_policy = "${file("${path.module}/policies/autoscale-assume-role.json")}"
}

data "template_file" "cloudwatch-policy" {
  template = "${file("${path.module}/policies/cloudwatch.json")}"

  vars {
    ecs_service_arn = "${var.ecs_service_arn}"
  }
}

resource "aws_iam_role_policy" "cloudwatch" {
  role   = "${aws_iam_role.autoscaling.name}"
  policy = "${data.template_file.cloudwatch-policy.rendered}"
}
