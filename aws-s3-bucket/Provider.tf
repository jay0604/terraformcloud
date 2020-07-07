
#defining the provider
provider "aws" {
  region = "us-west-2"
  version = "=2.67.0"
}

variable "bucketname" {
  type = string
  description = "name of the bucket"
  
}