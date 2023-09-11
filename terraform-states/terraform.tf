terraform {
  backend "s3" {
    bucket = "finance-bucket-2023"
    key = "hello-key"
    region = "us-east-1"
  }
}