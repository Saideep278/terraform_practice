module "ec2-pvt-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"
  depends_on = [ module.vpc ] # this module is created only after the module vpc is created,,,
  name = "${var.environment}-pvt_instance"
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  subnet_id = module.vpc.private_subnets[0]
  vpc_security_group_ids = [ module.private_sg.security_group_id ] 
  
  tags = local.common_tags
  
}

#count = var.private_instance_count