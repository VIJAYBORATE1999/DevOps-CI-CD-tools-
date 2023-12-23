#######################################################################################################
#                          Converting the  (Ansible) MAIN.YAML -->  to  Terrafrom Resources Steps     #
#######################################################################################################
#Boiler Plate Code 
data "aws_caller_identity" "current" {}
data "aws_region" "current" {} 

resource "aws_opensearch_domain" "local_domain" {
  domain_name    = "local_domain"
  engine_version = "Elasticsearch_7.10"

  cluster_config {
    instance_type = "r4.large.search"
  }

  tags = {
    Domain = "TestDomain"
  }
}
resource "aws_opensearch_domain" "remote_domain" {
  domain_name    = "remote_domain"
  engine_version = "Elasticsearch_7.10"

  cluster_config {
    instance_type = "r4.large.search"
  }

  tags = {
    Domain = "TestDomain"
  }
}


#                                          ANSIBLE TASK 1 
#- name: Create elasticsearch outbound cross replication connection (LOcal & Remote Both)


resource "aws_opensearch_outbound_connection" "foo" {
  connection_alias = "outbound_connection"
  local_domain_info {
    owner_id    = data.aws_caller_identity.current.account_id
    region      = data.aws_region.current.name
    domain_name = aws_opensearch_domain.local_domain.domain_name
  }

  remote_domain_info {
    owner_id    = data.aws_caller_identity.current.account_id
    region      = data.aws_region.current.name
    domain_name = aws_opensearch_domain.remote_domain.domain_name
  }
}
 
#                                       ANSIBLE TASK 2 
# - name: Accept elasticsearch inbound replication connection

resource "aws_opensearch_inbound_connection_accepter" "foo" {
  connection_id = aws_opensearch_outbound_connection.foo.id
}


#######################################################################################################
#                           (Ansible) REPLICATION.YAML -->   Terrafrom Resources                      #
#######################################################################################################

#                                    ANSIBLE TASK 1
#- name: Get ES cluster auth secrets

data "aws_secretsmanager_secret" "by-arn" {
  arn = "arn:aws:secretsmanager:us-east-1:123xxxxxx12:secret:example-123xx56"
}
output "secrets_es_cluster_auth" {
  value = data.aws_secretsmanager_secret.by-arn.secret_string
}

#                                    ANSIBLE TASK 2
#- name: Get ES cluster auth secrets

data "aws_elasticsearch_domain" "es_domain" {
  domain_name = "my-domain-name"
}
output "es_endpoint" {
  value = data.aws_elasticsearch_domain.es_domain.endpoint
}

#                                    ANSIBLE TASK 3
#- name: Delete ES Index
#

#Solution :create a null_resource with a local-exec provisioner that executes a script or command




# Use local-exec provisioner to delete Elasticsearch indices
resource "null_resource" "delete_indices" {
  count = var.delete_indices ? 1 : 0     #creates intances of null resource 

  triggers = {                
    always_run = timestamp()           #triggered every time 
  }

  provisioner "local-exec" {
    command = <<EOT
      curl -XDELETE "${data.aws_elasticsearch_domain.es_domain.endpoint}/nuxxxo*"
    EOT
#curl to send HTTP DELETE request to Elasticsearch cluster, targeting indices matching pattern "nuxxxo*
    environment = {
      ES_USERNAME = var.es_username
      ES_PASSWORD = var.es_password
    }
  }
}




