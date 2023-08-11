# ----


terraform {
  required_version = ">= 0.13.0"
  backend "s3" {
    bucket = "terraform.study" 
    region = "ap-northeast-1"
    key = "terraform.tfstate"
  }
}
provider "aws" {
  region = "ap-northeast-1"
}