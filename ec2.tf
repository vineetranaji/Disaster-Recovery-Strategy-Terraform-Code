# Fetching the existing security group from the state
data "aws_security_group" "application_sg" {
  name   = "launch-wizard-1"  # Replace with the actual security group name if different
  vpc_id = "vpc-0cf9c8bf976465e4f"  # Make sure to use the correct VPC ID
}

# Fetching the existing IAM instance profile from the state
data "aws_iam_instance_profile" "ec2_s3_access" {
  name = "ec2s3accessrole"  # Replace with the actual instance profile name
}

# aws_instance.application-server:
resource "aws_instance" "application-server" {
  ami                    = "ami-053284fc22a2c3f82"
  instance_type          = "t2.micro"
  key_name               = "application-server"
  iam_instance_profile   = data.aws_iam_instance_profile.ec2_s3_access.arn  # Using the instance profile ARN
  security_groups        = [data.aws_security_group.application_sg.name]  # Using SG name from state
  subnet_id              = "subnet-01eedaf0a4fed5d13"
  tags                   = {
    "Name" = "application-server"
  }
  vpc_security_group_ids = [data.aws_security_group.application_sg.id]  # Using SG ID from state
}
