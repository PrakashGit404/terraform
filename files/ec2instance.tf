# create securituy group
 
  resource "aws_security_group" "websg" {
    name = "terraform-webserver"
  ingress {
    from_port = "${var.server_port}"  
    to_port = "${var.server_port}"
    protocl = "tcp"
    cidr_block = ["0.0.0.0/0"]

  }
}

  variable “server_port” {
    description = “The port the server will use for HTTP requests”
    default = 80
}

