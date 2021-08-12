
provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
  assume_role {
    role_arn = "${var.provider_env_roles[terraform.workspace]}"
  }
}

locals {
  common_tags = {
    Owner_Name       = "cloud-watch"
    Line_of_Business = split("-",terraform.workspace)[0]
    Application_Name = "cloud-watch"
    Enviroment_Name  = split("-",terraform.workspace)[1]
  }
}


resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${terraform.workspace}-cloudwatch-main-dashboard"
  
  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "CPUUtilization"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "EC2|CPU Utilization"
      }
    },
    {
      "type": "metric",
      "x": 8,
      "y": 0,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "NetworkIn"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "EC2|Network In"
      }
    },
    {
      "type": "metric",
      "x": 16,
      "y": 0,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "NetworkOut"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "EC2|Network Out"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 6,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "DiskReadOps"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "EC2|Disk Read Ops"
      }
    },
    {
      "type": "metric",
      "x": 8,
      "y": 6,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "DiskWriteOps"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "EC2|Disk Write Ops"
      }
    },
    {
      "type": "metric",
      "x": 16,
      "y": 6,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/ApiGateway",
            "4XXError"
          ],
          [
            "AWS/ApiGateway",
            "5XXError"
          ],
          [
            "AWS/ApiGateway",
            "Count"
          ],
          [
            "AWS/ApiGateway",
            "Latency"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "API Gateway|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 12,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "Backup",
            "NumberOfBackupJobsCompleted"
          ],
          [
             "Backup",
            "NumberOfBackupJobsAborted"
          ],
          [
            "Backup",
            "NumberOfBackupJobsFailed"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "Backup|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 8,
      "y": 12,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/TransitGateway",
            "BytesDropCountBlackhole"
          ],
          [
             "AWS/TransitGateway",
            "BytesDropCountNoRoute"
          ],
          [
            "AWS/TransitGateway",
            "BytesIn"
          ],
          [
            "AWS/TransitGateway",
            "BytesOut"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "Transit Gateway|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 16,
      "y": 12,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/VPN",
            "TunnelState"
          ],
          [
             "AWS/VPN",
            "TunnelDataIn"
          ],
          [
            "AWS/VPN",
            "TunnelDataOut"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "VPN|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 18,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/Athena",
            "EngineExecutionTime"
          ],
          [
            "AWS/Athena",
            "ProcessedBytes"
          ],
          [
            "AWS/Athena",
            "ServiceProcessingTime"
          ],
          [
            "AWS/Athena",
            "TotalExecutionTime "
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "Athena|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 8,
      "y": 18,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/ApplicationELB",
            "ActiveConnectionCount"
          ],
          [
            "AWS/ApplicationELB",
            "HTTP_Redirect_Count"
          ],
          [
            "AWS/ApplicationELB",
            "HTTPCode_ELB_4XX_Count"
          ],
          [
            "AWS/ApplicationELB",
            "HTTPCode_ELB_5XX_Count"
          ],
          [
            "AWS/ApplicationELB",
            "NewConnectionCount"
          ],
          [
            "AWS/ApplicationELB",
            "RejectedConnectionCount"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "Application ELB|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 16,
      "y": 18,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/ELB",
            "BackendConnectionErrors"
          ],
          [
            "AWS/ELB",
            "HTTPCode_Backend_4XX"
          ],
          [
            "AWS/ELB",
            "HTTPCode_Backend_5XX"
          ],
          [
            "AWS/ELB",
            "Latency"
          ],
          [
            "AWS/ELB",
            "RequestCount"
          ],
          [
            "AWS/ELB",
            "UnHealthyHostCount"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "ELB|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 24,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/Lambda",
            "Invocations"
          ],
          [
            "AWS/Lambda",
            "Errors"
          ],
          [
            "AWS/Lambda",
            "DestinationDeliveryFailures"
          ],
          [
            "AWS/Lambda",
            "Duration"
          ],
          [
            "AWS/Lambda",
            "RequestCount"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "Lambda|Main Stats"
      }
    },
    {
      "type": "metric",
      "x": 8,
      "y": 24,
      "width": 8,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/S3",
            "BucketSizeBytes"
          ],
          [
            "AWS/S3",
            "NumberOfObjects"
          ],
          [
            "AWS/S3",
            "DeleteRequests"
          ],
          [
            "AWS/S3",
            "5xxErrors"
          ],
          [
            "AWS/S3",
            "TotalRequestLatency"
          ]
        ],
        "period": 60,
        "stat": "Maximum",
        "region": "ap-southeast-1",
        "title": "S3|Main Stats"
      }
    }
  ]
}
EOF

}

resource "aws_sns_topic" "cloud_watch_alarm_topic" {
  count        = length(var.alarm_type)
  name         = "cloud-watch-${var.alarm_type[count.index]}-alarm-topic"
  display_name = "CW Alarm | ${var.alarm_type[count.index]} | ${terraform.workspace}"
  tags         = local.common_tags
}

resource "aws_sns_topic_subscription" "cloud_watch_alarm_email_target" {
  count     = length(var.alarm_type)
  topic_arn = aws_sns_topic.cloud_watch_alarm_topic[count.index].arn
  protocol  = "email"
  endpoint  = "AWS-CloudWatch-XXXXXXXX@XXXXXXX.com" 
} 

resource "aws_cloudwatch_metric_alarm" "cw_alarm" {
  count                     = length(var.alarm_type)
  alarm_name                = "${var.alarm_type[count.index]}-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = var.metric_name[count.index] 
  namespace                 = var.name_space[count.index]
  period                    = var.period[count.index]
  statistic                 = var.statistic[count.index]
  threshold                 = var.threshold[count.index]
  alarm_description         = "This metric monitors ${var.alarm_type[count.index]}"
  insufficient_data_actions = []
  
  actions_enabled           = "true"
  alarm_actions             = [aws_sns_topic.cloud_watch_alarm_topic[count.index].arn]
  tags                      = local.common_tags
}
