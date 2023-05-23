// Github actions demo workflow

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }
}

provider "aws" {
  region = us-east-1
}

module "nocode_s3_static_website" {
  source = "app.terraform.io/billgrant/nocode-s3-static-website/aws"
  prefix = "github"
  env    = "actions"
}

output "endpoint" {
  description = "URL endpoint of the website."
  value       = module.nocode_s3_static_website.endpoint
}

output "product" {
  description = "The product which was randomly selected."
  value       = module.nocode_s3_static_website.product
}