# --------------
# Module Outputs
# --------------
output "cloudwatch_metric_alarm_id" {
  description = "The ID of the health check"
  value       = "${aws_cloudwatch_metric_alarm.this.id}"
}
