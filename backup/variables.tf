# Backup Plan Name
variable "backup_plan_name" {
  description = "The name of the backup plan"
  type        = string
  default     = "backup-plan"
}

# Daily Backup Rule Variables
variable "daily_backup_rule_name" {
  description = "The name of the daily backup rule"
  type        = string
  default     = "DailyBackups"
}

variable "daily_target_vault_name" {
  description = "The name of the target vault for daily backups"
  type        = string
  default     = "Default"
}

variable "daily_schedule" {
  description = "The cron schedule for daily backups"
  type        = string
  default     = "cron(0 5 ? * * *)"
}

variable "daily_start_window" {
  description = "The time window in minutes to start the backup"
  type        = number
  default     = 480
}

variable "daily_completion_window" {
  description = "The time window in minutes to complete the backup"
  type        = number
  default     = 10080
}

variable "daily_enable_continuous_backup" {
  description = "Enable continuous backups for the daily rule"
  type        = bool
  default     = false
}

variable "daily_cold_storage_after" {
  description = "Time in days after which the backup is moved to cold storage"
  type        = number
  default     = 0
}

variable "daily_delete_after" {
  description = "Time in days after which the backup is deleted"
  type        = number
  default     = 35
}

# General Backup Rule Variables
variable "backup_rule_name" {
  description = "The name of the general backup rule"
  type        = string
  default     = "backup-rule"
}

variable "backup_target_vault_name" {
  description = "The name of the target vault for general backups"
  type        = string
  default     = "backup_vault"
}

variable "backup_schedule" {
  description = "The cron schedule for general backups"
  type        = string
  default     = "cron(5 12 ? * * *)"
}

variable "backup_start_window" {
  description = "The time window in minutes to start the general backup"
  type        = number
  default     = 60
}

variable "backup_completion_window" {
  description = "The time window in minutes to complete the general backup"
  type        = number
  default     = 120
}

variable "backup_enable_continuous_backup" {
  description = "Enable continuous backups for the general rule"
  type        = bool
  default     = true
}

variable "backup_cold_storage_after" {
  description = "Time in days after which the general backup is moved to cold storage"
  type        = number
  default     = 0
}

variable "backup_delete_after" {
  description = "Time in days after which the general backup is deleted"
  type        = number
  default     = 7
}

variable "iam_role_arn" {
  description = "IAM role for backup selection"
  type        = string
  default     = "arn:aws:iam::851725542166:role/BackupS3AccessRole"  # Default value here
}
