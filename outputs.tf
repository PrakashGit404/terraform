output "ipaddrs_data" {
  value = ["${aws_instance.web.*.ip}"]
}
