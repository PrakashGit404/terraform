provider "aws" {
  region = "ap-south-1"
} 

resource "aws_s3_bucket" "mybkt" {
  bucket = "asndkjask_bkt"
  acl = "public"
  
  tags = {
    name = "mybktt"
    Environment = "Dev"
 }
}
