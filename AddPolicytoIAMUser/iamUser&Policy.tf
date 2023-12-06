terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
         region = "ap-southeast-1"
}

resource "aws_iam_user_policy_attachment" "attach" {
  user       = var.user
  policy_arn = each.value
  for_each   = toset(var.managedpolicy)
}
