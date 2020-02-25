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
variable "ami_id" {
  default = "ami_ids"
}
variable "aws_key" {
  default = "appsone_key"
}
variable "pub_key" {
  default = "ssh+++++++public key"
}
variable "cidr_block" {
  default = "0.0.0.0/0"
}
data "template_file" "myuserdata" {
  template = "${file("${templates}/appsone_prqs.tpl")}"
}

data "aws_availability_zones" "all" {}
