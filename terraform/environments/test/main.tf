provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}


module "create_infra" {
  source = "../../modules/module"
  vpc_cidr_block = "172.16.0.0/16"
  subnet_cidr_block =  "172.16.10.0/24"
}
