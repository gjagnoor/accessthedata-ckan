FROM postgres:12-alpine
MAINTAINER Open Knowledge International

# Customize default user/pass/db
ENV POSTGRES_DB ckan
ENV POSTGRES_USER ckan
ARG POSTGRES_PASSWORD 26487666Cal
ARG DATASTORE_READONLY_PASSWORD
ENV POSTGRES_HOST_AUTH_METHOD=trust

# Include extra setup scripts (eg datastore)
ADD docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
