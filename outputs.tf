output "daily_backup_rule_name" {
  value = [for rule in aws_backup_plan.backup_plan.rule : rule.rule_name if rule.rule_name != null][0]
}

output "backup_rule_name" {
  value = [for rule in aws_backup_plan.backup_plan.rule : rule.rule_name if rule.rule_name != null][0]
}

output "backup_plan_id" {
  value = aws_backup_plan.backup_plan.id
}