# Use Node LTS base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy project files
COPY package*.json ./
RUN npm install

COPY . .

# Build the website using Parcel
RUN npm run build

# Use lightweight server to serve static files
RUN npm install -g serve

# Expose port
EXPOSE 3000

# Run the app
CMD ["serve", "-s", "dist", "-l", "3000"]
