variable server_port{
  default = "22"
}
variable ami{
  default = "ami-97785bed" 
}
variable instance_type{
  default = "t2.micro" 
}
variable vpc_cidr_block{
  default = "172.16.0.0/16"
}
variable subnet_cidr_block{
  default = "172.16.10.0/24"
}
