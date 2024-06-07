# Define base image
FROM node:latest

# Define work directory
WORKDIR /app

# Add a non-root user
RUN groupadd -r myuser && useradd -r -g myuser myuser

# Change ownership of the working directory to the non-root user
RUN chown -R myuser:myuser /app

# Switch to the non-root user
USER myuser


# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Expose port
EXPOSE 3000

# Run the app
CMD ["node", "index.js"]