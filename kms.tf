resource "aws_kms_key" "kms-key" {
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  is_enabled               = true
  key_usage                = "ENCRYPT_DECRYPT"
  multi_region             = false
  policy                   = jsonencode(
    {
      Id        = "key-consolepolicy-3"
      Statement = [
        {
          Action    = "kms:*"
          Effect    = "Allow"
          Principal = {
            AWS = "arn:aws:iam::851725542166:root"
          }
          Resource  = "*"
          Sid       = "Enable IAM User Permissions"
        },
        {
          Action    = [
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
            "kms:RotateKeyOnDemand",
          ]
          Effect    = "Allow"
          Principal = {
            AWS = [
              "AROA4MTWMMMLAUZD7ECVH",
              "arn:aws:iam::851725542166:role/ec2s3accessrole",
              "arn:aws:iam::851725542166:role/aws-service-role/backup.amazonaws.com/AWSServiceRoleForBackup",
            ]
          }
          Resource  = "*"
          Sid       = "Allow access for Key Administrators"
        },
      ]
      Version   = "2012-10-17"
    }
  )
}
