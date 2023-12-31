# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the Angular app
RUN ng build

# Expose the port on which the app will run
EXPOSE 4200

# Command to run the application with pm2
CMD ["pm2-runtime", "start", "npm", "--", "start", "/src/]
