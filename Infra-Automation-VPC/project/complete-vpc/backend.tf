terraform {
  backend "s3" {
    bucket = "terraform-infra-code-lola-version"
    key = "infra-tfstate"
  }
}
