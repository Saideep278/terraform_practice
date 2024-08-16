/*output "instance_publicip" {
  description = "instance ip"
  value = aws_instance.terraform2_instance.public_ip
}


output "ins_ava" {
  value = data.aws_ec2_instance_type_offering.inst_type.instance_type
}*/


# Output all availability zones
output "o1" {
  value = data.aws_availability_zones.my_zones.names
}


#above output displays the all those az available

output "o2" {
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.inst_type:
    az => details.instance_types if length(details.instance_types) != 0
  }
}

output "o3" {
  value = keys({
    for az,details in data.aws_ec2_instance_type_offerings.inst_type:
    az => details.instance_types if length(details.instance_types) != 0
  })
}



#above output displays the only those az which supports my instance