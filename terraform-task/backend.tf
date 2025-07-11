terraform {
  backend "s3" {
    bucket         = "particle41-state-bucket"
    key            = "ecs/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
