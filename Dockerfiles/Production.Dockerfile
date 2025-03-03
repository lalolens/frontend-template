# Stage 1: Build the project using Node.js and your Makefile
FROM node:18-alpine AS builder
WORKDIR /app

# # Copy the rest of your project files
# COPY . .

# # Build the project using your Makefile target (runs "npm run build")
# RUN make build

# Stage 2: Serve the built files with Nginx
FROM nginx:alpine

# Remove default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# # Copy only the production-ready static files from the build stage
# COPY --from=builder /app/dist /usr/share/nginx/html

COPY dist/ /usr/share/nginx/html/


# List the contents of the web root to verify the files
RUN ls -al /usr/share/nginx/html

# Expose port 80 for Nginx
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
