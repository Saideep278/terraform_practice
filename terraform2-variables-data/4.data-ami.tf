

#data block is used to query the data exisiting outside the terraform, like ami,vpc,aws glu ..

data "aws_ami" "ubuntu" {
  
  most_recent      = true

  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}


#it will query az available by default
# why we are quering
# using for each loop we can deploy an instance in those az 
data "aws_availability_zones" "my_zones" {
  filter{
     name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}