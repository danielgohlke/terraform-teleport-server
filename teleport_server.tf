resource "aws_instance" "teleport_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.teleport_sg.id]

  tags = {
    Name = "teleport-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y

              curl https://goteleport.com/static/install.sh | sudo bash -s 14.3.3

              sudo teleport configure -o file \
                  --acme --acme-email=${var.acme_email} \
                  --cluster-name=${var.cluster_name}

              sudo systemctl enable teleport
              sudo systemctl start teleport

              # wait for service to be ready
              sleep 10


              sudo tctl users add teleport-admin --roles=editor,access --logins=root,ubuntu,ec2-user | sudo tee -a teleport_invite_url

              EOF
}

