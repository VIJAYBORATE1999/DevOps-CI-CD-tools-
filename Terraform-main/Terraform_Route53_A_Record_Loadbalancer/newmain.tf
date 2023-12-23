data "kubernetes_service" "example" {
  metadata {
    name      = "ingress-nginx-controller"  # Name of Ingress Nginx Service
    namespace = "ingress-nginx"  # Namespace of Ingress Nginx Service
  }
  
}
output "ingress_nginx_service_url" {
  value = data.kubernetes_service.ingress_nginx.status.0.load_balancer.0.ingress.0.ip
}

resource "aws_route53_record" "example" {
  zone_id = "data.aws_route53_zone.k8.zone_id"
  name    = "example.com"
  type    = "A"
  ttl     = "300"
  records = [data.kubernetes_service.example.status.0.load_balancer.0.ingress.0.hostname]
}