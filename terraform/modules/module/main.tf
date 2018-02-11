resource "aws_vpc" "my_vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  tags {
    Name = "tf-example"
  }
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_subnet" "my_subnet" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "${var.subnet_cidr_block}"
  availability_zone = "us-east-1a"
  tags {
    Name = "tf-example"
  }
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "example" {
  ami  = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.my_subnet.id}"
  vpc_security_group_ids = ["${aws_default_security_group.instance.id}"]
 #vpc_security_group_ids = ["${aws_security_group.instance.id}"] 
  lifecycle {
    create_before_destroy = true
  }
  tags {
    Name = "tf-example"
  }

}

/*resource "aws_security_group" "instance" {
  name = "terraform_group"
  vpc_id = "${aws_vpc.my_vpc.id}"
  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
  tags {
    Name = "tf-example"
  }
*/

resource "aws_default_security_group" "instance" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
  tags {
    Name = "tf-example"
  }

}

