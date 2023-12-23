#############################################################################################<BR>
TASK  : we have Client EC2 instance with Grafana running.
I want to send my ec2 instnace logs to Grafana server.

Solution : we neeed following service on ec2
 - Node exporter runs at 9100 (not installed)
 - Prometheus runs at port 9095 (not istalled)
 - Grafana runs at port 3000 (installed)

Understand : 
 - Node exporter is used when application is unable to generate logs .
   Node Exporter is a Prometheus exporter that collects various system-level 
   metrics from a target system and exposes them in a format that Prometheus can scrape.

 - Prometheus reads information from node exporter (not best for visualization )and 
 
 - Grafana is used for better for visualization but needs a data source.So Prometheus 
   is data source for Grafana
 

Use case :
When an application generate metrices then Prometheus takes that metrices as input 
and send to grafana. But here Since EC2 is itself is not capable to generate metrices 
so we use Node exporter to send metrices from ec2 to Prometheus. 


I wanted to read logs of this AWS EC2 Instance Whose public ip => XXX.XXX.XX.XXX
and send it to Grafana running On Port 3000 of  my same EC2 => http://XXX.XXX.XX.XXX:3000/

#############################################################################################

Step 1) DO SSH to login to EC2 Instance

ssh USERNAME@PUBLIC_IP -p PORT_NUMBER

ENTER PASSWORD IN PROMPT

#############################################################################################


STEP 2) INSTALL GRAFANA ON EC2 (ALREADY INSTALLED)


#############################################################################################

STEP 3)INSTALL Node Exporter 


wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz
tar xvfz node_exporter-1.2.2.linux-amd64.tar.gz
cd node_exporter-1.2.2.linux-amd64
sudo useradd -rs /bin/false node_exporter
sudo cp node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
sudo nano /etc/systemd/system/node_exporter.service


Now write following code in node_exporter.service file ==> 


[Unit]
Description=Node Exporter
After=network.target

[Service]
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target



save the file 
Use  curl command to see metrices from Node exporter

curl http://localhost:9100/metrics  

Node exporter  By default runs at  PORT 9100

#############################################################################################

Step 4) Install Promethus on EC2

wget https://github.com/prometheus/prometheus/releases/download/v2.33.0/prometheus-2.33.0.linux-amd64.tar.gz
tar -xvzf prometheus-2.33.0.linux-amd64.tar.gz
cd prometheus-2.33.0.linux-amd64
tar xvfz prometheus-2.30.3.linux-amd64.tar.gz
cd prometheus-2.30.3.linux-amd64
nano prometheus.yml


Now write following code in prometheus.yml file



global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9096']

  - job_name: 'node'
    static_configs:
      - targets: ['localhost:9100']
      
      


save the file 

- Now run the command This WILL START PROMETHUS AT 9090 BY DEFAULT

./prometheus --config.file=prometheus.yml


- TO FORCEFULLY RUN PROMETHUS AT OTHER PORT LET SAY 9095: 
 ./prometheus --config.file=prometheus.yml --web.enable-admin-api --web.listen-address=:9095



- Now poromethus will run at 9095 . Use curl command to see output 
curl http://localhost:9095/metrics

#############################################################################################

STEP 6) Go to AWS and Expose Ports so we can access them at local also 
      
      Node exporter  - (9100)     
      PROMETHUS  -  (9095)         
      GRAFANA   -  (3000)    



SO NOW FROM YOUR LOCAL YOU WILL BE ABLE TO ACESS APPLICATIONS :

      
      Node exporter URL :       http://EC2_PUBLIC_IP:9100/metrics     
      PROMETHUS URL :           http://EC2_PUBLIC_IP:9095/metrics
                                http://EC2_PUBLIC_IP:9095/targets
      GRAFANA  :                http://EC2_PUBLIC_IP:3000


*)Now open PROMETHUS URL On LOCAL:  http://EC2_PUBLIC_IP:9095/targets
  
YOU SHOULD SEE PAGE  WITH CONTENT => 


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Targets

- node (1/1 up)
   - Endpoint	=> http://localhost:9100/metrics	& instance="localhost:9100"job="node"

- prometheus (1/1 up)
  - Endpoint => http://localhost:9095/metrics	  & instance="localhost:9095"job="prometheus"

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++










*)Now open Node exporter URL On LOCAL:  http://EC2_PUBLIC_IP:9100/targets

YOU SHOULD SEE PAGE WITH CONTENT => 






+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#HELP go_gc_cycles_automatic_gc_cycles_total Count of completed GC cycles generated by the Go runtime.
#TYPE go_gc_cycles_automatic_gc_cycles_total counter
go_gc_cycles_automatic_gc_cycles_total 1288
#HELP go_gc_cycles_forced_gc_cycles_total Count of completed GC cycles forced by the application.
#TYPE go_gc_cycles_forced_gc_cycles_total counter
go_gc_cycles_forced_gc_cycles_total 0
#HELP go_gc_cycles_total_gc_cycles_total Count of all completed GC cycles.
#TYPE go_gc_cycles_total_gc_cycles_total counter
go_gc_cycles_total_gc_cycles_total 1288
#HELP go_gc_duration_seconds A summary of the pause duration of garbage collection cycles.
#TYPE go_gc_duration_seconds summary
go_gc_duration_seconds{quantile="0"} 0.000133066
go_gc_duration_seconds{quantile="0.25"} 0.000209291
go_gc_duration_seconds{quantile="0.5"} 0.000295821
go_gc_duration_seconds{quantile="0.75"} 0.000341521
go_gc_duration_seconds{quantile="1"} 0.000823396
go_gc_duration_seconds_sum 0.335052177
go_gc_duration_seconds_count 1288
#HELP go_gc_heap_allocs_by_size_bytes_total Distribution of heap allocations by approximate size. Note that this does not include tiny objects as defined by /gc/heap/tiny/allocs:objects, only tiny blocks.
#TYPE go_gc_heap_allocs_by_size_bytes_total histogram
go_gc_heap_allocs_by_size_bytes_total_bucket{le="8.999999999999998"} 2.345651e+06
go_gc_heap_allocs_by_size_bytes_total_bucket{le="24.999999999999996"} 4.2870261e+07
go_gc_heap_allocs_by_size_bytes_total_bucket{le="64.99999999999999"} 5.6914917e+07
go_gc_heap_allocs_by_size_bytes_total_bucket{le="144.99999999999997"} 6.609e+07
go_gc_heap_allocs_by_size_bytes_total_bucket{le="320.99999999999994"} 6.7209362e+07
go_gc_heap_allocs_by_size_bytes_total_bucket{le="704.9999999999999"} 6.743771e+07
go_gc_heap_allocs_by_size_bytes_total_bucket{le="1536.9999999999998"} 6.7537971e+07
go_gc_heap_allocs_by_size_bytes_total_bucket{le="3200.9999999999995"} 6.7665131e+07
go_gc_heap_allocs_by_size_bytes_total_bucket{le="6528.999999999999"} 6.7759833e+07
...........................................................................
...........................................
...................
.........
.....
..
.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#############################################################################################
Step 7) Grafana Configuration 

 - For first time Login:

   Username: admin
   Password: admin

   After logging in for the first time, Grafana will prompt you to change the default password.


 - THen Configure Data Source - Prometheus   
  give name of data source = "vijay-testing"
   and give Prometheus server URL and then click Save & test
   
   
 - Then make a dash board  --> Add visualization
   Select data source as "vijay-testing"

   
 - From Prometheus use Metrics Explorer and search any random metrices suppose :      go_gc_heap_frees_by_size_bytes_total_bucket 


- OPEN GRAFANA 
USE QUERY BUILDER FOR VISUALIZATION--> write a query for above metrics

histogram_quantile(0.95, sum by (le) (rate(go_gc_heap_frees_by_size_bytes_total_bucket{instance="localhost:9095", job="prometheus"}[5m])))

Run the Query to get logs VISUALIZATION !!!!!!!!!!!!!!!!!!!!!
#############################################################################################

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
