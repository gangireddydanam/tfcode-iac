resource "aws_s3_bucket" "test" {
  bucket = "demo-static-website-hosting-tf"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}