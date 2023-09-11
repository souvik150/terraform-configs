# Configure the AWS provider
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Create an EC2 key pair and store it in the local file system
resource "aws_key_pair" "example" {
  key_name   = "example-keypair"
  public_key = file("~/.ssh/id_rsa.pub") # Replace with your SSH public key path
}

# Create a security group to allow SSH, HTTP, and HTTPS traffic from anywhere
resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Allow SSH, HTTP, and HTTPS traffic from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-01c647eace872fc02"
  instance_type = "t2.micro"            
  key_name      = aws_key_pair.example.key_name
  security_groups = [aws_security_group.example.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "Hello, World!"
              EOF

  tags = {
    Name = "example-instance"
  }
}
