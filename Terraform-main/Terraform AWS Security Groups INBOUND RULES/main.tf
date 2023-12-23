provider "aws" {
  region = "your_region"
  # Add your AWS credentials here
}

# Security Group 1
resource "aws_security_group" "sgr_00243a27dc10e268c" {
  name        = "sgr-00243a27dc10e268c"
  description = "Security Group for TCP port 80"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group 2
resource "aws_security_group" "sgr_07e92a6b21c2bba0a" {
  name        = "sgr-07e92a6b21c2bba0a"
  description = "Security Group allowing All traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group 3
resource "aws_security_group" "sgr_0f6f47622af511c06" {
  name        = "sgr-0f6f47622af511c06"
  description = "Security Group for UDP traffic on all ports"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group 4
resource "aws_security_group" "sgr_0bf65eb8803769a48" {
  name        = "sgr-0bf65eb8803769a48"
  description = "Security Group for TCP port 1433 from 223.184.8.253/32"
  
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["223.184.8.253/32"]
  }
}

# Security Group 5
resource "aws_security_group" "sgr_0645f4fc0abc84fc2" {
  name        = "sgr-0645f4fc0abc84fc2"
  description = "Security Group for TCP port 1433 from 106.216.201.180/32"
  
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["106.216.201.180/32"]
  }
}

# Security Group 6
resource "aws_security_group" "sgr_0b564d7358a6a20ff" {
  name        = "sgr-0b564d7358a6a20ff"
  description = "Security Group for TCP port 443"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group 7
resource "aws_security_group" "sgr_0d131f24c0789ea89" {
  name        = "sgr-0d131f24c0789ea89"
  description = "Security Group for all TCP traffic on all ports"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group 8
resource "aws_security_group" "sgr_06882bffb8221431b" {
  name        = "sgr-06882bffb8221431b"
  description = "Security Group for TCP port 1433 from 183.82.118.40/32"
  
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["183.82.118.40/32"]
  }
}
