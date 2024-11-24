# Variables for EC2 to S3 Role
variable "ec2_s3_role_name" {
  description = "The name of the IAM role for EC2 to access S3"
  type        = string
  default     = "ec2s3accessrole"
}

variable "ec2_s3_role_description" {
  description = "The description of the IAM role for EC2 to access S3"
  type        = string
  default     = "Allows EC2 instances to call AWS services on your behalf."
}

variable "ec2_s3_managed_policy_arns" {
  description = "The managed policy ARNs attached to the EC2 to S3 role"
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/AmazonS3FullAccess"]
}

variable "ec2_s3_role_path" {
  description = "The path of the IAM role for EC2 to access S3"
  type        = string
  default     = "/"
}

# Variables for Backup to S3 Role
variable "backup_s3_role_name" {
  description = "The name of the IAM role for AWS Backup to access S3"
  type        = string
  default     = "BackupS3AccessRole"
}

variable "backup_s3_role_description" {
  description = "The description of the IAM role for AWS Backup to access S3"
  type        = string
  default     = "Allows AWS Backup to access AWS resources on your behalf based on the permissions you define."
}

variable "backup_s3_managed_policy_arns" {
  description = "The managed policy ARNs attached to the Backup to S3 role"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/AmazonEventBridgeReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
  ]
}

variable "backup_s3_role_path" {
  description = "The path of the IAM role for AWS Backup to access S3"
  type        = string
  default     = "/"
}

variable "backup_s3_inline_policy_name" {
  description = "The name of the inline policy attached to the Backup to S3 role"
  type        = string
  default     = "EventBridgePutRulePolicy"
}

variable "backup_s3_inline_policy_actions" {
  description = "The list of actions allowed by the inline policy for AWS Backup"
  type        = list(string)
  default     = [
    "events:PutRule",
    "events:PutTargets",
    "events:ListRules",
    "events:ListTargetsByRule",
    "events:DescribeRule",
    "events:DeleteRule",
    "events:RemoveTargets"
  ]
}
