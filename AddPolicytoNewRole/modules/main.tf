module "mo_role" {
  source = "../../AddPolicytoNewRole"
  role   = "terraroletest"
  managedpolicy = [
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
    ]
}