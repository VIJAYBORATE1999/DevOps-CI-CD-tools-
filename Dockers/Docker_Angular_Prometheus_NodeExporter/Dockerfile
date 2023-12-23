
# Stage 1: Compile and Build Angular Codebase
# Use official node image as the base image
FROM node:latest as build

# Set the working directory
WORKDIR /usr/local/app

# Add the source code to app
COPY . /usr/local/app/

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build

# Stage 2: Serve app locally
# Use the lightweight http-server to serve the built Angular app
FROM node:alpine

# Set the working directory
WORKDIR /usr/local/app

# Copy the built Angular application from the previous stage
COPY --from=build /usr/local/app/dist/demo /usr/local/app

# Install http-server globally
RUN npm install -g http-server

# Install Prometheus
USER root
RUN apk --no-cache add curl
RUN curl -LO "https://github.com/prometheus/prometheus/releases/download/v2.29.2/prometheus-2.29.2.linux-amd64.tar.gz" \
    && tar -xzf prometheus-2.29.2.linux-amd64.tar.gz \
    && mv prometheus-2.29.2.linux-amd64 prometheus \
    && rm prometheus-2.29.2.linux-amd64.tar.gz

# Create Prometheus configuration
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Install prom-client
RUN npm install prom-client

# Expose port 4500 for Angular Application
EXPOSE 4500

# Expose Prometheus
EXPOSE 9090

# Command to run the Angular app using http-server on port 4500
# CMD ["http-server", "-p", "4500"]
# Start Prometheus and your Angular app
CMD ["sh", "-c", "prometheus/prometheus --config.file=/etc/prometheus/prometheus.yml & http-server -p 4500"]