output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "security_group_name" {
  value = aws_security_group.ec2_sg.name
}

output "security_group_vpc_id" {
  value = aws_security_group.ec2_sg.vpc_id
}

output "security_group_arn" {
  value = aws_security_group.ec2_sg.arn
}