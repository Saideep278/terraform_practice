
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

# Fetch all availability zones that do not require opt-in
data "aws_availability_zones" "my_zones" {
  filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Fetch the instance type offering in each availability zone
data "aws_ec2_instance_type_offerings" "inst_type" {
  for_each = toset(data.aws_availability_zones.my_zones.names)
  filter {
    name = "instance-type"
    values = ["t3.large"]
  }
  filter {
    name = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}
