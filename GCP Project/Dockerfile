# Use the official Node.js base image
FROM node:14

# Set the working directory
WORKDIR /index

# Copy the package.json and package-lock.json files to the container
COPY package*.json /index/

# Install application dependencies
RUN npm install

# Copy the application code to the container
COPY index.js /index/index.js

# Command to run the application
CMD ["node", "index.js"]
