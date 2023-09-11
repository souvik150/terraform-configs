module "us_payroll" {
  source = "../payroll-app"
  app_region = "us-east-1"
  ami = "ami-01c647eace872fc02"
}