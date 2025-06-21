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