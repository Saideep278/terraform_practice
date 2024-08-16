module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"
  depends_on = [ module.vpc ]
  name = "${var.environment}-public_bastionhost"
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.instance_keypair

  associate_public_ip_address =true
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [ module.public_bastion_sg.security_group_id ]
  tags = local.common_tags
}