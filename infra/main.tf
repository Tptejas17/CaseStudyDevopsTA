provider "aws" {
  region = var.region
}

resource "aws_key_pair" "mypair"{
  key_name = "terraformkey"
  public_key = file("terraformkey.pub")
}

resource "aws_instance" "web" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.mypair.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow.id]

  tags = {
    Name = "DevOpsCaseStudyInstance"
  }
}

resource "aws_security_group" "allow" {
  name        = "allow_ssh_http"

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
