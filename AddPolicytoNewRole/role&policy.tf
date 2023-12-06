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

resource "aws_iam_role" "newrole"{
    name = var.role
    assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::896836667748:root"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
})
}


resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.newrole.name
  policy_arn = each.value
  for_each   = toset(var.managedpolicy)
  depends_on = [aws_iam_role.newrole]
}
