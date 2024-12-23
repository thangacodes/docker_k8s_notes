# Use official Node.js image from the Docker Hub
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and install the dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app files
COPY . .

# Expose the port that the app will run on
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
