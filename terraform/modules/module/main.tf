resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  tags {
    Name = "tf-example"
  }
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_subnet" "my_subnet" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "172.16.10.0/24"
  availability_zone = "us-east-1a"
  tags {
    Name = "tf-example"
  }
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_instance" "example" {
  ami  = "ami-97785bed"
  instance_type = "t2.micro"
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

