# terraform-aws-cloudwatch-alarms
This is a Terraform module for AWS that is used to manage CloudWatch alarms.

## Dependencies  
This module requires a number of input variables listed below.

## Variables  
```
alarm_name:          The descriptive name for the alarm

alarm_description:   The description for the alarm"

alarm_actions:       The list of actions to execute when this alarm transitions into 
an ALARM state from any other state

metric_name:         The name for the alarm's associated metric
                     See: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html

namespace:           The namespace for the alarm's associated metric
                     See: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-namespaces.html

comparison_operator: The namespace for the alarm's associated metric
                     Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold.

statistic:           The statistic to apply to the alarm's associated metric
                     Either of the following is supported: 
                     
                     SampleCount 
                     Average 
                     Sum 
                     Minimum 
                     Maximum

threshold:           The value against which the specified statistic is compared

period:              The period in seconds over which the specified statistic is applied

evaluation_periods:  The number of periods over which data is compared to the specified threshold

treat_missing_data:  Sets how this alarm is to handle missing data points
                     The following values are supported: 
                     
                     missing
                     ignore
                     breaching
                     notBreaching

dimensions:          The dimensions for the alarm's associated metric
```

## Outputs
```
cloudwatch_metric_alarm_id: The ID of the health check
```

## Example Usage  
```
module "" {
  source = "../<path-to>/terraform-aws-cloudwatch-alarm"

  alarm_name        = "YOUR_ALARM_NAME"
  alarm_description = "YOUR_ALARM_DESCRIPTION"
  alarm_actions     = ["${aws_autoscaling_policy.your_policy.arn}"]

  dimensions = {
    DimensionType = "Dimension_Value"
  }

  metric_name         = "CPUReservation"
  namespace           = "AWS/ECS"
  comparison_operator = "LessThanThreshold"
  statistic           = "Maximum"
  threshold           = "50"
  period              = "600"
  evaluation_periods  = "1"
  treat_missing_data  = "notBreaching"
}
```
