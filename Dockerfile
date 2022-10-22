# base image - apache server
FROM node:12-alpine
# directory where all our files will be copies 
WORKDIR /app

RUN echo "NODE Version:" && node --version
# copy package.json and all the other files from the current directory to workdir, install the packages
RUN npm install
COPY . ./

