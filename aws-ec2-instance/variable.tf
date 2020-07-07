variable "instance_type" {
    type = string
    description = "instancetype"
    default = "t2.micro"
}

variable "image_id" {
    type = string
    description = "Image to be used for Instance"
    default = "ami-003634241a8fcdec0"
}

variable "custom_tags" {
    type = map(string)
    description = "custom tag for the instance"
    default = {}
}

# variable "bucket" {
#     type = string
#     description = "S3 bucket to store the key"
#     default = "lab-terraform-backend"
# }

# variable "key" {
#     type = string
#     description = "path to store terraform state"
#     default = "global/ec2/terraform.state"
# }