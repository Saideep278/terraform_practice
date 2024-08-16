output "vpcid" {
  description = "vpc id"
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "vpc id"
  value = module.vpc.vpc_cidr_block
}
