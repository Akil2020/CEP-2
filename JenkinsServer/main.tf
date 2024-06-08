resource "aws_instance" "jenkins_server" {
ami           = var.ami_id 			#Ubuntu, 24.04 LTS
instance_type = var.instance_type
key_name      = var.key_name
tags = {
Name = "JenkinsServer"
}
security_groups = [aws_security_group.jenkins_sg.name]
}
resource "aws_security_group" "jenkins_sg" {
name        = "jenkins_sg"
description = "Security group for Jenkins server"
ingress {
from_port   = 22
to_port     = 22
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port   = 8080
to_port     = 8080
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port   = 443
to_port     = 443
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
resource "aws_instance" "k8s-node1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "k8s-node1"
  }

  security_groups = [aws_security_group.jenkins_sg.name]
}

output "JenkinsServer_Public_IP" {
  value = aws_instance.jenkins_server.public_ip
}

output "k8s-node1_Public_IP" {
  value = aws_instance.k8s-node1.public_ip
}
