variable "region" {
    type = string
    description = "region of deplyment"
    default = "us-west-2"
}

variable "username" {
    type = list(string)
    description = "usernames to be created"
 
    default = ["san","dan","jan"]
}

variable "cloud_access" {
    type = bool
    description = "if true , user is assigned cloud access"
    default = "true"
}