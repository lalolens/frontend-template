# Stage 1: Build the project using Node.js
FROM node:18-alpine AS builder
WORKDIR /app

# Install build tools including make (and optionally build-base if needed)
RUN apk add --no-cache make

# Copy source code and install dependencies then build the project
COPY . .
RUN make install build

# Stage 2: Serve the built files with Nginx
FROM nginx:alpine

# Remove default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy the production-ready static files from the build stage
COPY --from=builder /app/dist /usr/share/nginx/html/

# List the contents of the web root (for debugging)
RUN ls -al /usr/share/nginx/html

# Expose port 80 for Nginx
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
