
# Define assume role variables

variable "provider_env_roles"{
  type = map(string)
  default = {
    "sand-box"           = ""
    "log-archive"        = "arn:aws:iam::098115615930:role/BAL-terraform-assume-role"
    "bi-dev"             = "arn:aws:iam::150650419624:role/BAL-terraform-assume-role"
    "bi-prod"            = "arn:aws:iam::574823305770:role/BAL-terraform-assume-role"
    "bi-uat"             = "arn:aws:iam::405173819454:role/BAL-terraform-assume-role"
    "bpo-prod"           = "arn:aws:iam::928904688698:role/BAL-terraform-assume-role"
    "erp-dev"            = "arn:aws:iam::942785181932:role/BAL-terraform-assume-role"
    "erp-teamshare"      = "arn:aws:iam::305059261627:role/BAL-terraform-assume-role"
    "erp-uat"            = "arn:aws:iam::119075389333:role/BAL-terraform-assume-role"
    "log-prod"           = "arn:aws:iam::134489340995:role/BAL-terraform-assume-role"
    "network-prod"       = "arn:aws:iam::502827736305:role/BAL-terraform-assume-role"
    "reporting-dev"      = "arn:aws:iam::260871509364:role/BAL-terraform-assume-role"
    "reporting-prod"     = "arn:aws:iam::251761060295:role/BAL-terraform-assume-role"
    "reporting-uat"      = "arn:aws:iam::682518111111:role/BAL-terraform-assume-role"
    "security-prod"      = "arn:aws:iam::924978575735:role/BAL-terraform-assume-role"
    "shared-services"    = "arn:aws:iam::328680294982:role/BAL-terraform-assume-role"
    "sharedservice-dev"  = "arn:aws:iam::374320175743:role/BAL-terraform-assume-role"
    "sharedservice-prod" = "arn:aws:iam::459810568614:role/BAL-terraform-assume-role"
    "sharedservice-uat"  = "arn:aws:iam::018305339911:role/BAL-terraform-assume-role"
    "audit-prod"         = "arn:aws:iam::782284673882:role/BAL-terraform-assume-role"
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
