provider "aws" {
  region = "us-west-1"
}


resource "aws_instance" "ec2_terraform" {
  ami = "ami-0d8f565fbb5955283"
  instance_type = "t2.micro"
  tags = {
    "Name" = "EC2 From Terraform"
  }
  security_groups = [ aws_security_group.http_https_terraform.name ]
  key_name = aws_key_pair.key_cali.key_name
}

resource "aws_key_pair" "key_cali" {
  key_name = "key_cali"
  public_key = file(var.path_to_public_key)
}

resource "aws_security_group" "http_https_terraform" {
  name = "allow http/https"

  dynamic "ingress" {
    iterator = port
    for_each = var.ports
    content{
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    "name" = "web_traffic"
  } 
}