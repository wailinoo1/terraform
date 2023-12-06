module "user" {
  source = "../../AddPolicytoIAMUser"
  user   = "wailin"
  managedpolicy = [
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
    ]
}