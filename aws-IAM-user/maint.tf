provider "aws" {
  region = var.region

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}
# #user creation with count
# resource "aws_iam_user" "creation" {
#     count = length(var.username)
#     name = var.username[count.index]
  
# }

#user creation with for_each loop
resource "aws_iam_user" "username" {
    for_each = toset(var.username)
    name = each.value
  
}

#assigning role to users
resource "aws_iam_policy" "cloud_watch_readonly"{
  name = "cloud-watch-read-only"
  policy = data.aws_iam_policy_document.cloudwatch_read_only.json
}

data "aws_iam_policy_document" "cloudwatch_read_only" {
  statement {
    effect = "Allow"
    actions = [ "cloudwatch:Describe*" , "cloudwatch:Get*" , "cloudwatch:List*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy_attachment" "read_access" {
  count = var.cloud_access  ? 1 : 0
  user = "$(aws_iam_user.username)[0].name"
  policy_arn = aws_iam_policy.cloud_watch_readonly.arn
}

terraform {
  backend "s3" {

     bucket         = "lab-terraform-backend"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-2"
    

  }
}