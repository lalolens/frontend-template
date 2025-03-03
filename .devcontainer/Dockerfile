FROM node:20-alpine

WORKDIR /app

# Install build tools and git if needed
RUN apk add --no-cache make git

# (Optional) Set ownership of /app in case it matters for the user you switch to.
RUN chown -R node:node /app

# Switch to non-root user for better security
USER node

# (Optional) Disable engine strict if needed
RUN npm config set engine-strict false

# Expose the port your dev server runs on (5173)
EXPOSE 5173

# Start the development server (using your Makefile's "run" target)
CMD ["make", "run"]
