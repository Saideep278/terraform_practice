variable "aws_region" {
  description = "region in which resource to be created"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "username" {
  type = list(string)
  default = [ "sai","mani","ram" ]
  #key=value
}