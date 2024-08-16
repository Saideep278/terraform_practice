locals {
  owners = var.bussiness_devision
  environment = var.environment
  name = "${var.bussiness_devision}-${var.environment}"
  common_tags ={
    owners = local.owners
    environment = local.environment
  }
}