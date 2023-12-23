# Documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster

provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = var.cluster_id
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port
}
