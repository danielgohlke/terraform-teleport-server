variable "aws_region" {
  description = "AWS region where resources will be created"
  default     = "eu-north-1"  # Replace with your desired default region
}

variable "ami_id" {
  description = "AMI ID for the Teleport-compatible image"
  #  default     = "ami-0506d6d51f1916a96"  
  default = "ami-0d0b75c8c47ed0edf" # Amazon Linux 2023 if needed Replace with the appropriate Teleport-compatible AMI
}

variable "key_name" {
  description = "Name of the AWS key pair"
  default     = "ssh_key_ec2"  # Replace with your key pair name
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"  # Adjust instance type as needed
}

variable "acme_email" {
  description = "Email address for ACME (Let's Encrypt) certificate"
  default     = "username@your_domain.com"  # Replace with your email address
}

variable "cluster_name" {
  description = "Cluster name for Teleport"
  default     = "teleport.project.megadodo.org"  # Replace with your desired cluster name
}

# Rename route53.tf to route53.tf_ if you dont need that
variable "hosted_zone_name" {
  description = "Name for Hosted Zone"
  default     = "project.megadodo.org"  # Replace with your desired cluster name
}


