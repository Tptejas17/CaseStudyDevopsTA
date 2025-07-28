# Use official Node.js LTS image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY src/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY src/ .

# Expose the port the app runs on
EXPOSE 3000

# Run the app
CMD ["node", "index.js"]

