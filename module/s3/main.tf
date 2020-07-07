module "s3" {
    source = "../../aws-s3-bucket"
    bucketname = var.bucket
    
}

