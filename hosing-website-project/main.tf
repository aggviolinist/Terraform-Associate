# Creating S3 bucket
resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucketname
}