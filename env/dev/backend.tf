terraform {
  backend "s3" {
    bucket = "kkk-tf-test-bucket" 
    key    = "dev/terraform.tfstate"
    region = "eu-central-1"
    encrypt = true
  }
}
