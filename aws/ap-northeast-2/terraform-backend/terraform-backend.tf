resource "aws_s3_bucket" "test-s3-tf-state" {

  bucket = "test-s3-tf-state"

  tags = {
    "Name" = "test-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "test-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.test-s3-tf-state]
  name         = "test-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "test-ddb-tf-lock"
  }

}