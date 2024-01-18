terraform {
  required_version = "~>1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.32.0"
    }
  }
  #remote backend --=store tfstate in s3


}