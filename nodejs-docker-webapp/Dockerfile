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


# Serve static files (e.g., images, stylesheets) from the 'public' directory
RUN mkdir -p /usr/src/app/public
COPY ./public /usr/src/app/public

# Start the application
CMD ["node", "index.js"]