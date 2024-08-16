

# resource block
resource "aws_instance" "demo_server" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  tags = {
    "name" = "terraform_server"
  }
}

