# terraform {
#   backend "s3" {
#     bucket         = "test-terraform-states-an"
#     key            = "test/mytest"
#     region         = "eu-west-2"
#     dynamodb_table = "terraform_locks"
#     encrypt        = true
#   }
# }
