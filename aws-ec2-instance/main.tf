provider "aws" {
    region = "us-west-2"
    version = "~> 2.0"
  
}

resource "aws_instance" "ec2" {
  ami = var.image_id
  instance_type = var.instance_type
#   custom_tags = {
#       Owner = "jay"
#       DeployedBy = "terraform"
#   }
#   tag {
#     key = "Name"
#     value = "EC2staging"
#     propapagate_at_launch = true
#   }

#   dynamic "tag" {
#       for_each = var.custom_tags

#       content {
#           key = tag.key
#           value = tag.value
#           propapagate_at_launch = true
#       }

# }

}

# resource "aws_cloudwatch_metric_alarm" "low_cpu_credit_balance"{
#     alarm_name = "$(aws_instance.ec2.name)-low-cpu"
#     namespace = "AWS/EC2"
#     metric_name = "CPUcreditbalance"
# }
terraform {
  backend "s3" {
    bucket         =  "lab-terraform-backend"
    key            =  "global/ec2/terraform.state"
    region         = "us-west-2"
    
  }
}

