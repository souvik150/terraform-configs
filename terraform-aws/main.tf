
provider "aws" {
  region = "us-east-1"
}

// ---------------------- IAM USER ------------------------

# resource "aws_iam_user" "admin-user" {
#   name="souvik150"
#   tags = {
#     Description: "Technical Team Lead"
#   } 
# }

# resource "aws_iam_policy" "adminUser" {
#   name        = "AdminUserPolicy"
#   description = "IAM policy for admin user"

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": "*",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_user_policy_attachment" "souvik-admin-access" {
#   user = aws_iam_user.admin-user.name
#   policy_arn = aws_iam_policy.adminUser.arn
# }


// ---------------------- S3 Bucket ------------------------

# # Create an S3 bucket
# resource "aws_s3_bucket" "finance" {
#   bucket = "finance-bucket-2023"
#   tags = {
#     Name = "Finance Bucket"
#   }
# }

# # Upload an object to the bucket
# resource "aws_s3_bucket_object" "finance-2023" {
#   source = "/home/souvik150/Souvik/Terraform/terraform-aws/files/index.html"
#   key    = "index.html"
#   bucket = aws_s3_bucket.finance.id
# }

# # Create an S3 bucket policy that grants public read access to all objects
# resource "aws_s3_bucket_policy" "finance-policy" {
#   bucket = aws_s3_bucket.finance.id

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": "*",
#       "Action": "*",
#       "Resource": "${aws_s3_bucket.finance.arn}/*"
#     }
#   ]
# }
# EOF
# }

// ---------------------- Dynamo DB ------------------------

# resource "aws_dynamodb_table" "cars" {
#   name = "cars"
#   hash_key = "VIN"
#   billing_mode = "PAY_PER_REQUEST"
#   attribute {
#     name = "VIN"
#     type = "S"
#   }
# }

# resource "aws_dynamodb_table_item" "name" {
#   table_name = aws_dynamodb_table.cars.name
#   hash_key = aws_dynamodb_table.cars.hash_key

#   item = <<EOF
#   {
#     "VIN": {"S": "123456789"},
#     "Make": {"S": "Honda"},
#     "Model": {"S": "Civic"},
#     "Year": {"N": "2019"}
#   },
# EOF
# }