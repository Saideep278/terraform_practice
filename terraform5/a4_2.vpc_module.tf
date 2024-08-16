module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.12.0"
  name = "${local.name} - ${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs = var.vpc_availablity_zone
  private_subnets = var.vpc_pvt_subnet
  public_subnets = var.vpc_public_subnet
  #database_subnets = var.vpc_database_subnet

  #create_database_subnet_group = var.vpc_db_group_subnet
  #create_database_subnet_route_table = true #or you can call variable

  #enable_nat_gateway = true
  #single_nat_gateway = true


  #enable_dns_hostnames = true
  #enable_dns_support = true

  tags = local.common_tags
}
# by default vpc module create two subnets in each az, and each one of az has pub subnet and pvt subnet, follow resource map in aws console

# nat gateway is created in public subnet 










# traditional method
# resource "aws_vpc" "main" {
#   name = "myvpc"
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_subnet" "public" {
#   vpc_id = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = main
#   }

# }
# resource "aws_subnet" "pvt" {
#   vpc_id = aws_vpc.main.id
#   cidr_block = "10.0.2.0/24"
#   tags = {
#     Name = main
#   }

# }
# too many blocks are uused in traditional method, so modules are introduced 