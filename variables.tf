
# Define assume role variables

variable "provider_env_roles"{
  type = map(string)
  default = {
    "sand-box"           = ""
    "test-acc1"          = "arn:aws:iam::XXXXXXXXXXXX:role/terraform-assume-role"
    "test-acc2"          = "arn:aws:iam::XXXXXXXXXXXX:role/terraform-assume-role"
  }
}

# Define variables required for alarms

variable alarm_type {
  type        = list(string) 
  description = "Different Alarm Types"
}

variable evaluation_periods{
  type        = list(string) 
  description = "Evaluation Periods"
}

variable metric_name {
  type        = list(string) 
  description = "Metric Name"
}   

variable name_space {
  type        = list(string) 
  description = "Name Space"
}

variable period {
  type        = list(string) 
  description = "Period"
}

variable statistic {
  type        = list(string) 
  description = "Statistic"
}

variable threshold {
  type        = list(string) 
  description = "Threshold"
}

# Define instance ids

variable instance_id {
  type        = list(string) 
  description = "ID of each instance"
}
