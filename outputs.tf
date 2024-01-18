output "ami_id" {
  description = "print ami id"
  value       = data.aws_ami.amazon.id

}

output "public_ip" {
  description = "print public ip"
  value       = aws_instance.web.public_ip

}

# output "name" {
#     description = "print name"
#     value = aws_instance.web.name

# }