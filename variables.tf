variable "sg_description" {
  description = "Description of the security group"
  type        = string
  default     = "launch-wizard-1 created 2024-09-20T18:28:59.958Z"
}

# Egress
variable "egress_cidr_blocks" {
  description = "List of CIDR blocks for egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_description" {
  description = "Description of egress rule"
  type        = string
  default     = ""
}

variable "egress_from_port" {
  description = "Starting port for egress rule"
  type        = number
  default     = 0
}

variable "egress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR blocks for egress rule"
  type        = list(string)
  default     = []
}

variable "egress_prefix_list_ids" {
  description = "List of prefix list IDs for egress rule"
  type        = list(string)
  default     = []
}

variable "egress_protocol" {
  description = "Protocol for egress rule"
  type        = string
  default     = "-1"
}

variable "egress_security_groups" {
  description = "List of security groups for egress rule"
  type        = list(string)
  default     = []
}

variable "egress_self" {
  description = "Self attribute for egress rule"
  type        = bool
  default     = false
}

variable "egress_to_port" {
  description = "Ending port for egress rule"
  type        = number
  default     = 0
}

# Ingress
variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks for ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_description" {
  description = "Description of ingress rule"
  type        = string
  default     = ""
}

variable "ingress_from_port" {
  description = "Starting port for ingress rule"
  type        = number
  default     = 3389
}

variable "ingress_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR blocks for ingress rule"
  type        = list(string)
  default     = []
}

variable "ingress_prefix_list_ids" {
  description = "List of prefix list IDs for ingress rule"
  type        = list(string)
  default     = []
}

variable "ingress_protocol" {
  description = "Protocol for ingress rule"
  type        = string
  default     = "tcp"
}

variable "ingress_security_groups" {
  description = "List of security groups for ingress rule"
  type        = list(string)
  default     = []
}

variable "ingress_self" {
  description = "Self attribute for ingress rule"
  type        = bool
  default     = false
}

variable "ingress_to_port" {
  description = "Ending port for ingress rule"
  type        = number
  default     = 3389
}

# Security Group
variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "launch-wizard-1"
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
  default     = "vpc-0cf9c8bf976465e4f"
}

variable "tag_name" {
  description = "Tag name for the security group"
  type        = string
  default     = "ec2-sg"
}
