# base image - apache server
FROM httpd:latest
# directory where all our files will be copies 
WORKDIR /app

FROM node:latest
RUN echo "NODE Version:" && node --version
# copy package.json and all the other files from the current directory to workdir, install the packages
COPY package.json .
RUN npm install 
COPY . ./

# port your app will run on 
ENV PORT 8000
EXPOSE ${PORT}

# base image - apache server
FROM httpd:latest
# entry point of the application
CMD ["httpd", "ckanext/lacounts/templates/base.html"]