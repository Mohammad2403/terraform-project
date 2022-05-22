# Create a bucket
resource "aws_s3_bucket" "b1" {
bucket = "s3-terraform-bucket-lab-new2"
acl    = "private"   # or can be "public-read"
tags = {
Name        = "My bucket"
Environment = "Dev"
}
}

# Upload an object
resource "aws_s3_bucket_object" "object" {
bucket = aws_s3_bucket.b1.id
key    = "profile"
acl    = "private"  # or can be "public-read"
source = "C:/Users/AFSHEEN/OneDrive/Documents/New folder/coffee.jpg"
etag = filemd5("C:/Users/AFSHEEN/OneDrive/Documents/New folder/coffee.jpg")
}