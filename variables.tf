# Variable for SNS Display Name
variable "sns_display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = "sns_notification"
}

# Variable for SNS Topic Name
variable "sns_name" {
  description = "The name for the SNS topic"
  type        = string
  default     = "BackupJobNotifications"
}

# Variable for AWS Source Owner (AWS Account ID)
variable "source_owner" {
  description = "The AWS Account ID of the source owner"
  type        = string
  default     = "851725542166"
}

# Variable for SNS Topic ARN
variable "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  type        = string
  default     = "arn:aws:sns:ap-south-1:851725542166:BackupJobNotifications"
}
