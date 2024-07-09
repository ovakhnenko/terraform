output "my_websever_id" {
  value = aws_instance.my_websever.id
}

output "my_websever_ip" {
  value = aws_instance.my_websever.public_ip
}
