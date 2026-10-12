# Use the official Node.js 16 image as the base (Linux + Node + npm preinstalled)
FROM node:16

# Set the working directory inside the container; all later commands run here
WORKDIR /app

# Copy package.json and package-lock.json first so Docker can cache the install step
COPY package*.json ./

# Install the app's dependencies inside the image
RUN npm install

# Copy all remaining application files (app.js, public/, etc.) into the container
COPY . .

# Document that the app listens on port 3000 (the port is published at docker run time)
EXPOSE 3000

# Start the application when the container launches
CMD ["npm", "start"]