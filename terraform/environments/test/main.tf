provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

terraform {
  backend "s3" {
    bucket = "jami-terraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

module "create_infra" {
  source = "../../modules/module"
  vpc_cidr_block = "172.16.0.0/16"
  subnet_cidr_block =  "172.16.10.0/24"
}

