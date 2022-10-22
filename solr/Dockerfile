FROM solr:latest

# Enviroment
ENV SOLR_CORE ckan
ENV CKAN_VERSION dev-v2.7

# Create Directories
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE/conf
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE/data

# Adding Files
ADD solrconfig.xml \
https://raw.githubusercontent.com/ckan/ckan/$CKAN_VERSION/ckan/config/solr/schema.xml \
/opt/solr/server/solr/$SOLR_CORE/conf/

# Create Core.properties
RUN echo name=$SOLR_CORE > /opt/solr/server/solr/$SOLR_CORE/core.properties
