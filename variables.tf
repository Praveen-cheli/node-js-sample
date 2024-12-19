variable "region" {
  default     = "ap-south-1"
  description = "AWS region to deploy resources in."
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC."
}
