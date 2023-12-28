# Use a lightweight web server as a base image
FROM nginx:alpine

# Create a directory to store frontend files
WORKDIR /usr/share/nginx/html

# Copy the entire frontend directory to the container
COPY . .

# Expose port 80 (this is not strictly necessary since it's already exposed by default in the nginx base image)
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
