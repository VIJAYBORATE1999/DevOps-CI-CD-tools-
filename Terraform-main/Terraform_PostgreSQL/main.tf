terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
    }
  }
}

provider "postgresql" {
  host            = var.postgres_server_ip
  port            = 5432
  database        = "postgres"
  username        = var.postgres_user
  password        = var.postgres_password
  sslmode         = "require"
  connect_timeout = 15
}
