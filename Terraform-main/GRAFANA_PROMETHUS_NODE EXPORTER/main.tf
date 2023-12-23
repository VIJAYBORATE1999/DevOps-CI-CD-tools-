provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (replace with your desired AMI)
  instance_type = "t2.micro"               # Change the instance type as needed

  tags = {
    Name = "example-instance"
  }

  # Provisioner for installing Grafana, Node Exporter, and Prometheus
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -y software-properties-common",
      "sudo add-apt-repository 'deb https://packages.grafana.com/oss/deb stable main'",
      "wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -",
      "sudo apt-get update",
      "sudo apt-get install -y grafana",
      "sudo service grafana-server start",
      "sudo systemctl enable grafana-server",

      # Installing Node Exporter
      "wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz",
      "tar xvfz node_exporter-1.2.2.linux-amd64.tar.gz",
      "cd node_exporter-1.2.2.linux-amd64",
      "sudo useradd -rs /bin/false node_exporter",
      "sudo cp node_exporter /usr/local/bin",
      "sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter",
      "sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF",
      "[Unit]",
      "Description=Node Exporter",
      "After=network.target",
      "",
      "[Service]",
      "ExecStart=/usr/local/bin/node_exporter",
      "",
      "[Install]",
      "WantedBy=default.target",
      "EOF",
      "sudo systemctl daemon-reload",
      "sudo systemctl enable node_exporter",
      "sudo systemctl start node_exporter",

      # Installing Prometheus
      "wget https://github.com/prometheus/prometheus/releases/download/v2.33.0/prometheus-2.33.0.linux-amd64.tar.gz",
      "tar xvfz prometheus-2.33.0.linux-amd64.tar.gz",
      "cd prometheus-2.33.0.linux-amd64",
      "sudo tee prometheus.yml > /dev/null <<EOF",
      "global:",
      "  scrape_interval: 15s",
      "",
      "scrape_configs:",
      "  - job_name: 'prometheus'",
      "    static_configs:",
      "      - targets: ['localhost:9096']",
      "",
      "  - job_name: 'node'",
      "    static_configs:",
      "      - targets: ['localhost:9100']",
      "EOF",
      "./prometheus --config.file=prometheus.yml --web.enable-admin-api --web.listen-address=:9095",
    ]
  }
}
