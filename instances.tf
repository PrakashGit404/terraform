provider "aws" {
  region = "${var.region}"
}
resource "aws_instance" "web" {
  count = "${length(data.aws_availability_zones.all.names)}"
  availability_zone = "${data.aws_availability_zones.all.names[count.index]}"
  ami           = "${lookup(var.amis, var.region)}"
  instance_type     = "${var.instance_type}"
  security_groups  = "${aws_security_group.instance.id}"
  key_name      = "${aws_key_pair.keys.key_name}"
  
  tags = {
    Name = "Appsone-${count.index+1}"
  }
}
resource "aws_security_group" "instance" {
  name = "Appsone_sg"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = "${var.cidr_block}"
  }
}
resource "aws_key_pair" "keys" {
  key_name   = "${var.aws_key}"
  public_key = "${var.pub_key}"
}
