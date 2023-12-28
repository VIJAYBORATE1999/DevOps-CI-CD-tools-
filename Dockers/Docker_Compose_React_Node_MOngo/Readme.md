<pre>
#########################################################
               React Node Mongo DB

Folder Structure

/root
|    --backend
|        -
|        -
|        -dockerfile
|    --frontend
|        -
|        -
|        -dockerfile
|    --mongodb
|
|-docker-compose.yaml      
#########################################################
</pre>
<h3> Explanation of docker compose <h3>
<pre>
version: "3.8" #docker engine version

services:      # here we tell how to build images for each services 
  service_name1: #frontend : this service(Host) has its own docker file
    build: # ./Path_to the Service 1 Docker file 
    ports: # we define portmappping for service1   Port of HOST : Port of COntainer 
      - 3000:3000 
  service_name2: #backend  : this service(Host) has its own docker file
    build: # ./Path_to the Service 1 Docker file 
    ports: # we define portmappping for service2  Port of HOST : Port of COntainer 
      - 3001:3001
    environment:
      - variable1_name= #  - DB_URL=mongodb://db/vidly   (Syntax 1) this is Database conection string
      variable2_name:   #  DB_URL: mongodb://db/vidly    (Object Value Syntax 1)
  service_name3: #mongodb  : this service(Host) has its own docker file
    image: # here we dont have docker file ,instead we will pull from docker hub (mongo:4.0-xenial)
    ports: # we define portmappping for service2   Port of HOST : Port of COntainer 
      - 27017:27017 # mongo db by default listens at port 27017
    volumes: # We dont want mongo db to write data to temporarry file system of container
      - volume1_name:  # we will map this volume to directory Outside container.  - vidly:/data/db lets define this volume also

volumes:
  volume1_name: # lets define above volume before use

  # You can write service in any order.
</pre>

