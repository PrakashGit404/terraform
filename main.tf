provider "aws" {
  region = "${var.region}"
}
resource "aws_instance" "web" {
  # get the number of AZ's available in the region..&& loop the AZ's and launch instances in different AZ's.
  count = "${length(data.aws_availability_zones.all.names)}"
  availability_zone = "${data.aws_availability_zones.all.names[count.index]}"
  ami           = "${lookup(var.amis, var.region)}"
  instance_type     = "${var.instance_type}"
  security_groups  = ["${aws_security_group.heal_sg.id}"]
  key_name      = "${aws_key_pair.keys.key_name}"
  # download and install installer in 1st machine by invoking the script , other 2 instances acts as nodes..
  user_data = "${count.index == 0 ? data.template_file.master_data.template : data.template_file.slaves_data.template}"
  # user_data = "${data.template_file.master_data.template}"
  tags = {
    Name = "Heal-${count.index+1}"
  }
}
resource "aws_security_group" "heal_sg" {
  name = "heal_sg"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = "${var.cidr_block}"
  }
}
resource "aws_key_pair" "keys" {
  key_name   = "${var.aws_key}"
#  public_key = "${var.key_path}"
  public_key = "${file(var.key_path)}"
}
