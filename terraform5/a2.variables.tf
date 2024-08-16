variable "aws_region" {
  description = "region in which resource to be created"
  type = string
  default = "us-east-1"
}


variable "environment" {
  description = "env variable used as prefix"
  type = string
  default = "dev"
}

variable "bussiness_devision" {
  description = "bussiness division"
  type = string
  default = "sap"

}

/*
variable "username" {
  type = list(string)
  default = [ "sai","mani","ram" ]
  #key=value
}*/