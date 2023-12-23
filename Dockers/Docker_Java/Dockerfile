FROM maven:3.8.3-openjdk-11 AS build
WORKDIR /usr/src/app

COPY port_config.txt /usr/src/app/port_config.txt
COPY . /usr/src/app

RUN mvn clean package

FROM openjdk:11
WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/my-app-1.0-SNAPSHOT.jar /usr/src/app/my-app-1.0-SNAPSHOT.jar
COPY --from=build /usr/src/app/port_config.txt /usr/src/app/port_config.txt

CMD ["sh", "-c", "export PORT=$(cat port_config.txt) && java -jar my-app-1.0-SNAPSHOT.jar"]
