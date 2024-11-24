variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-053284fc22a2c3f82"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "application-server"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be deployed"
  type        = string
  default     = "subnet-01eedaf0a4fed5d13"
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "launch-wizard-1"
}