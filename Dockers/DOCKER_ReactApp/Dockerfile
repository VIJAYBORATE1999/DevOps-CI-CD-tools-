# Use the official Node.js image as a base image
FROM node:18.17.0

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port that the application will run on
EXPOSE 3050

# Command to run the application
CMD ["npm", "start"]
