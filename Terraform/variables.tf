variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.1.0/24"
}

variable "amis" {
  description = "AMIs by region"
  default = {
    eu-west-2 = "ami-09b89ad3c5769cca2"
  }
}

variable "region" {
  description = "EC2 Region for the VPC"
  default     = "eu-west-2"
}
