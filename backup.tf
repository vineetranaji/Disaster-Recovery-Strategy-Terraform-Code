data "aws_kms_key" "existing_kms" {
  key_id = "216eec37-13aa-48ad-96b6-aff4e5f0271b"  # Replace with your KMS key ID
}

# Data block to fetch the IAM role from the Terraform state
data "aws_iam_role" "backup_role" {
  name = "BackupS3AccessRole"
}


resource "aws_backup_vault" "backup_vault" {
  name        = "backup_vault"
  kms_key_arn = data.aws_kms_key.existing_kms.arn
  tags        = {}
}


# AWS Backup Selection using the IAM role from state
resource "aws_backup_selection" "backup_selection" {
  iam_role_arn = data.aws_iam_role.backup_role.arn  # Dynamically use the role from tfstate
  name         = "backup-sns-s3"
  plan_id      = aws_backup_plan.backup_plan.id  # Dynamically use the plan_id from the backup_plan resource
  resources    = [
    "arn:aws:s3:::mtechproj",
  ]
}

resource "aws_backup_plan" "backup_plan" {
  name = "backup-plan"

  rule {
    completion_window        = 120
    enable_continuous_backup = true
    rule_name                = "backup-rule"
    schedule                 = "cron(30 15 ? * * *)"
    start_window             = 60
    target_vault_name        = "backup_vault"

    copy_action {
      destination_vault_arn = "arn:aws:backup:us-east-1:851725542166:backup-vault:backup_vault"

      lifecycle {
        cold_storage_after = 0
        delete_after       = 7
      }
    }

    lifecycle {
      cold_storage_after = 0
      delete_after       = 7
    }
  }
}


