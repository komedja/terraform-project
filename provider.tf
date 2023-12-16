terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}


resource "aws_instance" "terraform_project" {
  ami           = var.ami
  instance_type = var.instance
  subnet_id = aws_subnet.my_subnet.id
  security_groups = [aws_security_group.my_sg.id]
  associate_public_ip_address = true
  key_name      = var.keypair

  tags = {
    Name = "terraform"
  }
  user_data = <<-EOF
    #!/bin/bash
    echo "*** Installing jenkins"
    sudo yum install java-11* -y
    sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum upgrade
    sudo yum install jenkins -y
    sudo systemctl start Jenkins
    sudo systemctl enable jenkins
    echo "*** Completed Installing jenkins"
    EOF
}

