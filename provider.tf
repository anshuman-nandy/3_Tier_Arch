provider "aws" {
  region  = var.region
  profile = "default"
  version = "~> 2.67.0"
}
