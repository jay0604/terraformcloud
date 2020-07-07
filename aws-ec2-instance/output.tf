output "IP" {
    value = aws_instance.ec2.public_ip
}

output "dns" {
    value = aws_instance.ec2.public_dns
}

output "arn" {
    value= aws_instance.ec2.arn
}

output "blocksize" {
    value = aws_instance.ec2.ebs_block_device
}