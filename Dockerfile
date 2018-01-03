# Build: `docker build -t argentina-api .`
# Run: `docker run -p 5001:5001 -i -t argentina-api`
# Access api in your browser by hitting: `localhost:5001/d`
# Note /d is because the environment is in development mode

# Get version of node in the container
FROM node:carbon

# Create dir in the container and cd
RUN	mkdir -p /usr/node/argentina-api
WORKDIR /usr/node/argentina-api

# Install app dependencies
COPY package*.json /usr/node/argentina-api
RUN yarn

# Bundle app source
COPY . .

# Run the api
RUN node ./app.js
