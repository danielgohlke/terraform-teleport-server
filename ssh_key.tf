resource "tls_private_key" "ec2_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_ssh_key.public_key_openssh

}

resource "local_sensitive_file" "pem_file" {
  filename = pathexpand("~/.ssh/${var.key_name}.pem")
  file_permission = "600"
  directory_permission = "700"
  content = tls_private_key.ec2_ssh_key.private_key_pem
}
