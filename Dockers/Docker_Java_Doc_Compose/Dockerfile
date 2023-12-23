FROM openjdk:11-jre-slim

# Install X11 libraries and fonts
RUN apt-get update && \
    apt-get install -y libxext6 libxrender1 libxtst6 libfreetype6

COPY mysql-connector-j-8.2.0.jar /usr/src/app/mysql-connector-java.jar
COPY . /usr/src/app
WORKDIR /usr/src/app

# Compile the Java code
RUN javac App.java

# Run the application
CMD ["java", "-Djava.awt.headless=true", "-cp", ".:/usr/src/app/mysql-connector-java.jar", "App"]
