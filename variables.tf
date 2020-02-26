variable "region" {
  type = "string"
  default = "us-west-2"
}
variable "amis" {
  type = "map"
  default = {
    "ap-south-1" = "ami-0c21ae4a3bd190229"
    "us-west-2" = "ami-0922553b7b0369273"
  }
}
variable "instance_type" {
  default = "t2.micro"
}
variable "aws_key" {
  default = "appsone_key"
}
variable "key_path" {
  description = "Public key path"
  default = "C:/Users/prakash.r/keyfornodes.key.pub"
}
variable "cidr_block" {
  default = ["0.0.0.0/0"]
}
data "template_file" "master_data" {
  template = "${file("../templates/master_prqs.sh")}"
}
data "template_file" "slaves_data" {
  template = "${file("../templates/slaves_prqs.sh")}"
}

data "aws_availability_zones" "all" {}
