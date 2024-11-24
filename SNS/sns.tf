# Data block to fetch the IAM role from the state
data "aws_iam_role" "backup_s3_access_role" {
  name = "BackupS3AccessRole"
}

# SNS Topic Resource
resource "aws_sns_topic" "BackupJobNotifications" {
  display_name                          = "sns_notification"
  http_failure_feedback_role_arn        = data.aws_iam_role.backup_s3_access_role.arn
  http_success_feedback_role_arn        = data.aws_iam_role.backup_s3_access_role.arn
  lambda_success_feedback_sample_rate   = 0
  name                                  = "BackupJobNotifications"
  policy                                = jsonencode(
    {
      Id        = "BackupServiceAllowSNSPublish"
      Statement = [
        {
          Action    = "SNS:Publish"
          Effect    = "Allow"
          Principal = {
            Service = "backup.amazonaws.com"
          }
          Resource  = "arn:aws:sns:ap-south-1:851725542166:BackupJobNotifications"
          Sid       = "BackupServiceAllowSNSPublish"
        },
        {
          Action    = "SNS:Publish"
          Effect    = "Allow"
          Principal = {
            Service = "events.amazonaws.com"
          }
          Resource  = "arn:aws:sns:ap-south-1:851725542166:BackupJobNotifications"
          Sid       = "AWSEvents_Notify-Backup"
        },
      ]
      Version   = "2012-10-17"
    }
  )
}
