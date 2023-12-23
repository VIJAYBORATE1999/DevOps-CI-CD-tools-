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
COPY --from=build /usr/local/app/dist/my-angular-app /usr/local/app

# Install http-server globally
RUN npm install -g http-server

# Expose port 4500
EXPOSE 4500

# Command to run the Angular app using http-server on port 4500
CMD ["http-server", "-p", "4500"]
