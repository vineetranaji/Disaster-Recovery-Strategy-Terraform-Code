resource "aws_s3_bucket" "mtechproj" {
  bucket = "mtechproj"

  tags = {
    Environment = "Production"
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      bucket_key_enabled = true

      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
