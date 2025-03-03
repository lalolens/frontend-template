FROM node:18-alpine

WORKDIR /app

# Install build tools including make (and optionally build-base if needed)
RUN apk add --no-cache make

# Copy the rest of your source code
COPY . .

# Install dependencies using your Makefile target (runs "npm install")
# RUN make install
RUN npm install

# Expose the port your dev server runs on (6173)
EXPOSE 5173

# Start the development server using your Makefile's run target (npm run dev)
CMD ["make", "run"]
