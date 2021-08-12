instance_id = []

alarm_type         = ["high-cpu","backup-failed","vpn-status"]

evaluation_periods = ["2","1","1"]
metric_name        = ["CPUUtilization","NumberOfBackupJobsFailed","TunnelState"] 
name_space         = ["AWS/EC2","Backup","AWS/VPN"]
period             = ["60","300","60"]
statistic          = ["Maximum","Sum","Sum"]
threshold          = ["80","1","1"]

