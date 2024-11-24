output "instance_id" {
  description = "The ID of the application server EC2 instance"
  value       = aws_instance.application-server.id
}

output "public_ip" {
  description = "The public IP of the application server EC2 instance"
  value       = aws_instance.application-server.public_ip
}
