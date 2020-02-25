variable "region" {
  type = "string"
  default = "ap-south-1"
}
variable "amis" {
  type = "map"
  default = {
    "ap-south-1" = "ami-0c21ae4a3bd190229"
    "us-east-1" = "ami-0922553b7b0369273"
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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPnJBKjt3wCDUybyC6HZdH0H/Q/yxSbP+OyaFuAxAZt0pRn/+9PjY80h7fo26d6uMb4GVY1x2lTpXp3BgTI9k2Ppeqmj+qfAuFTbnWlmQfyH9z+LPlFkLFEt0gpmwK9zFG1ZpvFszWPw4m1Li5mM2wu3Q5OYZsBfsWfKC0cET2gd0xfSXp8zsLlbHbLjd+l3yascaNPZxdsnz3KSCluKMv6KiZa0UnJVRWv+kC99h6yI6bnu/jaBEPrBK0SOffiTzWFtOH8JqeilpWB5rA0hHq2XIbzGXMIzLYuwZnlN9inMoz3gE8KeBaAjgZo7mNrxyTqsC+6UvJzYnIgdVLdDDBfevpfmwN/DdFQyg8CuW0xXxGDpxvpIJLeSDCnK/lpt7YPHXrjOObooAukWdvofMDJGrxXrEhC4lnKHYuppIwJpxbxrFKSESrVrdLjyW0NpcCWs6uq57Oo2CMJqukCVzYTKi/fUfwv7yIK3c58CMyCC9bfdUie4IuvT96sUKlyk8= prakash.r@HQSUPRAKRDT01"
}
variable "cidr_block" {
  default = "0.0.0.0/0"
}

data "aws_availability_zones" "all" {}
