# Disaster-Recovery-Strategy-Terraform-Code
Overview
This project demonstrates how to use Terraform to create a robust, three-tier architecture on AWS with disaster recovery capabilities. This architecture includes implementation of AWS Backup and creation of AWS Backup Vaults, integration with SNS (Simple Notification Service) for notifications, KMS (Key Management Service) for encryption, IAM (Identity and Access Management) for permissions, EC2 instances for application deployment, security groups for securing the application layer, and S3 buckets for data storage coming from application servers.

Key Components
1. Terraform
Terraform is an open-source infrastructure as code (IaC) tool that allows you to define and provision your infrastructure using a high-level configuration language. It supports various cloud providers, including AWS.

2. Three-Tier Architecture
A three-tier architecture separates an application into three logical tiers: presentation tier, application tier, and data tier. This separation enhances scalability, performance, and maintenance.

3. Disaster Recovery
Disaster recovery involves strategies and services to recover data and applications in case of disasters. This project implements disaster recovery using AWS Backup.

Application and Data Tier
EC2 Instances:
Deploy EC2 instances to host the application layer.
Create security groups to control inbound and outbound traffic to the EC2 instances.

SNS Integration:
Integrate AWS Backup with SNS to receive notifications about backup events.

KMS Integration:
Use KMS for encrypting the backups stored in the backup vaults.

Application Deployment
Application Code:
Created the taks scheudler which runs the code to triger aws sync command to store the data in S3 from EC2 instances.

Data Storage:
Store application data in the S3 buckets.

Disaster Recovery Testing:
Test the backup and restore process to ensure disaster recovery plans are effective.

Security and Compliance
IAM Policies:
Ensure IAM policies are properly configured to grant the necessary permissions to the resources.

Encryption:
Use KMS to encrypt sensitive data and backups.

Network Security:
Configure security groups to control network traffic and protect the application servers.

Conclusion
This project provides a comprehensive guide to setting up a three-tier architecture with disaster recovery on AWS using Terraform. It covers various aspects, including infrastructure setup, data management, security, and disaster recovery. By following this guide, you can build a scalable, secure, and resilient application infrastructure on AWS.
