resource "aws_security_group" "vpc_ssh" {
  name        = "allow_ssh_sai"
  description = "Allow ssh inbound traffic"
  #vpc_id      = aws_vpc.main.id

  ingress {
    description = "allow ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_sai"
  }
}

resource "aws_security_group" "vpc_http" {
  name        = "allow_http_sai"
  description = "Allow http inbound traffic"
  #vpc_id      = aws_vpc.main.id

  ingress {
    description = "allow http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http_sai"
  }
}