# Stage 1: Build the application
FROM node:16-bullseye-slim

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

EXPOSE 4000

# Start the application in development mode
CMD ["npm", "run", "backend:run"]