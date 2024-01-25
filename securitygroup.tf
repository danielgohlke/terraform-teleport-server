resource "aws_security_group" "teleport_sg" {
  name        = "teleport-sg"
  description = "Security group for Teleport"
}

resource "aws_security_group_rule" "teleport_sg_ingress_https" {
  security_group_id = aws_security_group.teleport_sg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "teleport_sg_ingress_ssh" {
  security_group_id = aws_security_group.teleport_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# allow any outgoing traffic
resource "aws_security_group_rule" "teleport_sg_egress_any" {
  security_group_id = aws_security_group.teleport_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

