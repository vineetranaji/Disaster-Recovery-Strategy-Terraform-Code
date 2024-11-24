# Variable for Bucket Name
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "mtechproj"  # You can change this default value
}

# Variable for Versioning
variable "versioning_enabled" {
  description = "Enable or disable versioning for the S3 bucket"
  type        = bool
  default     = true  # Change to 'false' if you want versioning disabled by default
}
