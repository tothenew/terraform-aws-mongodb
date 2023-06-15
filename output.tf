output "mongo_primary_private_ip"{
 value = aws_instance.mongo_primary.private_ip
}

output "secondary_private_ip" {
  value = aws_instance.mongo_secondary[*].private_ip
}

output "mongo_security_group_id" {
  value = aws_security_group.mongo_sg.id
}
