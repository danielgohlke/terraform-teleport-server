# if you do not need a hosted zone please comment this out or rename/delete the file
resource "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone_name
  tags = {
    Terraform   = "true"
    Environment = "production"
  }
}

resource "aws_route53_record" "teleport_entry" {
  zone_id = aws_route53_zone.hosted_zone.id
  name    = "teleport"
  type    = "A"
  ttl     = 60
  records = [aws_instance.teleport_instance.public_ip]
}

output "zone_id" {
  value = aws_route53_zone.hosted_zone.id
}

