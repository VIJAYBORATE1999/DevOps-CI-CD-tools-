output "endpoint" {
  value = "postgresql://${var.postgres_user}:${var.postgres_password}@${var.postgres_server_ip}:5432/postgres"
}
