provider "aws" {
  region = "us-east-1"
}


# S3
resource "aws_s3_bucket" "bucketjuyuju" {
bucket = "s3-terraform-bucket-lab-new-me"
acl    = "public-read"   # or can be "public-read"

tags = {
Name        = "My bucket"
Environment = "Dev"
}

}


# CloudFront

resource "aws_cloudfront_distribution" "cloudfront" {

  enabled             = true
  default_root_object = "index.html"
#   aliases             = [ "cloudfront.cloudgeeks.ca","doosra.saqlainmushtaq.com" ] # (Required) For HTTPS Requirement, must be DNS Validated & dns name must Only associated be associated with single distribution in single aws account.

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"] # "DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.bucketjuyuju.id
    viewer_protocol_policy = "redirect-to-https" # redirect-to-https # https-only # allow-all
  

    min_ttl                = 0
    default_ttl            = 86400