# Creating S3 bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucketname
}
# Giving ourselves permission with the bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
resource "aws_s3_bucket_ownership_controls" "bucket-ownership" {
  bucket = aws_s3_bucket.my-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
# Changing the "Individual Block Public Access settings for the bucket" to be able to be assesed 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block
resource "aws_s3_bucket_public_access_block" "bucket-ownership" {
  bucket = aws_s3_bucket.my-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
# Change the ACLs, this helps us read and write to the bucket, anyone can do so on AWS
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl
resource "aws_s3_bucket_acl" "buko-acls" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket-ownership,
    aws_s3_bucket_public_access_block.bucket-ownership,
  ]

  bucket = aws_s3_bucket.my-bucket.id
  acl    = "public-read"
}

# Uploading objects to buckets via terraform 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.my-bucket.id # Bucket name
    key = "index.html" # Name of file
    source = "./web-files/index.html" # Where file is at
    acl = "public-read" # acls to give permission
    content_type = "text/html" # what is the content of the file
}

resource "aws_s3_object" "style" {
    bucket = aws_s3_bucket.my-bucket.id # Bucket name
    key = "style.css" # Name of file
    source = "./web-files/style.css" # Where file is at
    acl = "public-read" # acls to give permission
    content_type = "text/css" # what is the content of the file
}

resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.my-bucket.id # Bucket name
    key = "error.html" # Name of file
    source = "./web-files/error.html" # Where file is at
    acl = "public-read" # acls to give permission
    content_type = "text/html" # what is the content of the file
}

resource "aws_s3_object" "profile" {
    bucket = aws_s3_bucket.my-bucket.id # Bucket name
    key = "picdevops.jpeg" # Name of file
    source = "./web-files/picdevops.jpeg" # Where file is at
    acl = "public-read" # acls to give permission
}

# Create website configuration
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.my-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [ aws_s3_bucket_acl.buko-acls ]
}