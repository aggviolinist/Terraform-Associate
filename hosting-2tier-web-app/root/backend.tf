terraform {
  backend "s3" {
    bucket = "buckoyangu"
    key    = "backend/two-tier-web-app.tfstate"
    region = "us-east-1"
    dynamodb_table = "remote-backend"
  }
}
# This file doesn't support variables thats why we have region hardcoded here
# On DynamoDB we use lockID as our partition key so that it works with terraform
