resource "null_resource" "name" {
  depends_on = [ module.ec2-instance ]

  connection {
    type     = "ssh"
    host     = aws_eip.publicinstance_bastion_ip.public_ip
    user     = "ubuntu"
    password = ""
    private_key = file("${path.root}/../pemfile/terraform-keypair.pem")
  }

  provisioner "file" {
    source      = "${path.root}/../pemfile/terraform-keypair.pem"
    destination = "/tmp/terraform-keypair.pem"
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo chmod 400 /tmp/terraform-keypair.pem",
        "touch /tmp/hello.txt",
        "echo Hello from null provision >> /tmp/hello.txt",
    ]
  }

  # provisioner "local-exec" {
  #   command = "echo vpc created on date and vpc id ${module.vpc.vpc_id} >> vpc-time.txt"
  #   working_dir = "local-exec-output-files"
  # }
}
