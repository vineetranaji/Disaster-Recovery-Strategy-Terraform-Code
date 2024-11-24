resource "aws_security_group" "ec2_sg" {
  name        = "launch-wizard-1"
  description = "launch-wizard-1 created 2024-09-20T18:28:59.958Z"
  vpc_id      = "vpc-0cf9c8bf976465e4f"
  tags = {
    Name = "ec2-sg"
  }

  ingress {
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
}


