provider "aws" {
  region = "us-east-1" 
}

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "network"
#   subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true
  
  tags = {
    Environment = "production"
  }
}

resource "aws_route53_zone" "primary" {
  name = "example.com"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "example.com"
  type    = "A"

  alias {
    name                   = aws_lb.test.dns_name
    zone_id                = aws_lb.test.zone_id
    evaluate_target_health = true
  }
}