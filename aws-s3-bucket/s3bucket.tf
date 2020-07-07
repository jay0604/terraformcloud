resource "aws_s3_bucket" "statebucket" {
  bucket = var.bucketname
  #to destroy the bucket using terrform destory
  force_destroy = true
  #protect against deletion
  # lifecycle {
  #   #prevent_destroy = true
     
  # }
  #versioning
  versioning {
    enabled = true
  }
  #encryption 
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}