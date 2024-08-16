# resource block
resource "aws_instance" "user_app_server" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/app-install.sh")
  tags = {
    "name" = "user_server"
  }
}
