resource "aws_eip" "publicinstance_bastion_ip" {
  depends_on = [ module.ec2-instance,module.vpc ]

  instance = module.ec2-instance.id
  #vpc = true
  tags = local.common_tags
  # provisioner "local-exec" {
  #   command = "echo eip destroyed on date >> destroytime.txt"
  #   working_dir = "local-exec-output-files"
  #   when=destroy
  # }
}