#Outputs:
output "sns_topic_arn" {
    value = aws_sns_topic.BackupJobNotifications.arn
}

output "sns_topic_name" {
    value = aws_sns_topic.BackupJobNotifications.name
}
