output "ec2_ips" {
  value = [module.ec2-instance.public_ip , module.ec2-pvt-instance.private_ip ]
}