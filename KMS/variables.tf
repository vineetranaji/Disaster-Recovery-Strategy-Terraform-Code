variable "kms_policy_id" {
  description = "ID of the KMS policy"
  type        = string
  default     = "key-consolepolicy-3"
}

variable "root_user_arn" {
  description = "ARN of the root user for IAM"
  type        = string
  default     = "arn:aws:iam::851725542166:root"
}

variable "kms_allowed_actions" {
  description = "List of KMS actions allowed for roles"
  type        = list(string)
  default     = [
    "kms:Create*",
    "kms:Describe*",
    "kms:Enable*",
    "kms:List*",
    "kms:Put*",
    "kms:Update*",
    "kms:Revoke*",
    "kms:Disable*",
    "kms:Get*",
    "kms:Delete*",
    "kms:TagResource",
    "kms:UntagResource",
    "kms:ScheduleKeyDeletion",
    "kms:CancelKeyDeletion",
    "kms:RotateKeyOnDemand"
  ]
}

variable "kms_role_arns" {
  description = "List of ARNs for roles allowed to use KMS"
  type        = list(string)
  default     = [
    "arn:aws:iam::851725542166:role/service-role/AWSBackupDefaultServiceRole",
    "arn:aws:iam::851725542166:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup",
    "arn:aws:iam::851725542166:role/ec2s3accessrole"
  ]
}

variable "kms_alias_name" {
  description = "KMS alias name"
  type        = string
  default     = "alias/kms-alias"
}

variable "kms_key_id" {
  description = "ID of the target KMS key"
  type        = string
  default     = "216eec37-13aa-48ad-96b6-aff4e5f0271b"
}
