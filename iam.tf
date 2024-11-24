resource "aws_iam_role" "ec2s3accessrole" {
  name               = "ec2s3accessrole"
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  ]
}

# aws_iam_role.BackupS3AccessRole:

resource "aws_iam_role" "BackupS3AccessRole" {
  name               = "BackupS3AccessRole"
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = [
            "backup.amazonaws.com",
            "sns.amazonaws.com",
          ]
        }
      },
    ]
    Version = "2012-10-17"
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEventBridgeReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
  ]
  
  inline_policy {
    name   = "AWSBackupSNSPublishPolicy"
    policy = jsonencode({
      Statement = [
        {
          Action   = "sns:Publish"
          Effect   = "Allow"
          Resource = "arn:aws:sns:ap-south-1:851725542166:BackupJobNotifications"
        },
      ]
      Version = "2012-10-17"
    })
  }
  
  inline_policy {
    name   = "EventBridgePutRulePolicy"
    policy = jsonencode({
      Statement = [
        {
          Action   = [
            "events:PutRule",
            "events:PutTargets",
            "events:ListRules",
            "events:ListTargetsByRule",
            "events:DescribeRule",
            "events:DeleteRule",
            "events:RemoveTargets",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    })
  }
  
  inline_policy {
    name   = "backup-sns-s3"
    policy = jsonencode({
      Statement = [
        {
          Action   = [
            "backup:StartReportJob",
            "backup:CopyFromBackupVault",
            "backup:ListBackupJobs",
            "backup:PutBackupVaultNotifications",
            "backup:DescribeCopyJob",
            "backup:ListProtectedResourcesByBackupVault",
            "sns:ListTopics",
            "backup:CopyIntoBackupVault",
            "backup:GetBackupVaultNotifications",
            "backup:DescribeProtectedResource",
            "sns:Publish",
            "backup:GetBackupPlanFromJSON",
            "backup:ListRecoveryPointsByBackupVault",
            "backup:StartCopyJob",
            "backup:ListCopyJobs",
            "backup:StartBackupJob",
            "backup:ListProtectedResources",
            "backup:DescribeBackupJob",
            "backup:DescribeRestoreJob",
            "sns:ListSubscriptions",
            "backup:ListRestoreJobs",
            "backup:CreateBackupVault",
            "backup:GetBackupPlan",
            "backup:ListBackupVaults",
            "backup:DescribeRecoveryPoint",
            "backup:ListBackupPlans",
            "backup:DescribeBackupVault",
            "backup:ListRecoveryPointsByResource",
            "backup:StopBackupJob",
            "backup:UpdateBackupPlan",
            "backup:CreateBackupPlan",
            "backup:ListRestoreJobsByProtectedResource",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Action   = [
            "sns:ListSubscriptionsByTopic",
            "sns:Publish",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:sns:ap-south-1:851725542166:BackupJobNotifications"
        },
        {
          Action   = "sns:ListTopics"
          Effect   = "Allow"
          Resource = "arn:aws:sns:ap-south-1:851725542166:BackupJobNotifications"
        },
      ]
      Version = "2012-10-17"
    })
  }
}

resource "aws_iam_role" "AWSBackupDefaultServiceRole" {
  name ="AWSBackupDefaultServiceRole"
}
resource "aws_iam_role" "AWSServiceRoleForBackup" {
  name ="AWSServiceRoleForBackup"
}