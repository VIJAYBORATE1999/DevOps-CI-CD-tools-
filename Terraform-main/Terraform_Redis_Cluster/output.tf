output "cache_cluster_id" {
  value = aws_elasticache_cluster.example.id
}

output "cache_cluster_address" {
  value = aws_elasticache_cluster.example.cache_nodes.0.address
}

output "cache_cluster_port" {
  value = aws_elasticache_cluster.example.cache_nodes.0.port
}
