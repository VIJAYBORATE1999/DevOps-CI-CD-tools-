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

  # You can write service in any order




  ########################################################################################

  version: "3.8" # Docker engine version

services:
  service_name1: # frontend: This service (Host) has its own Dockerfile
    build: ./frontend # Path to the Service 1 Dockerfile
    ports: # Port mapping for service 1: Port of HOST : Port of Container
      - 3000:3000

  service_name2: # backend: This service (Host) has its own Dockerfile
    build: ./backend # Path to the Service 2 Dockerfile
    ports: # Port mapping for service 2: Port of HOST : Port of Container
      - 3001:3001
    environment:
      - variable1_name= # - DB_URL=mongodb://db/vidly (Syntax 1)
      variable2_name:   # DB_URL: mongodb://db/vidly (Object Value Syntax 1)

  service_name3: # mongodb: This service (Host) has its own Dockerfile
    image: mongo:4.0-xenial # We pull the MongoDB image from Docker Hub
    ports: # Port mapping for service 3: Port of HOST : Port of Container
      - 27017:27017 # MongoDB by default listens at port 27017
    volumes: # We don't want MongoDB to write data to the temporary filesystem of the container
      - volume1_name: # We will map this volume to a directory outside the container. - vidly:/data/db. Let's define this volume as well

volumes:
  volume1_name: # Let's define the above volume before use

# You can write services in any order
</pre>
