FROM docker.elastic.co/elasticsearch/elasticsearch:8.6.1

RUN bin/elasticsearch-plugin install https://github.com/vhyza/elasticsearch-analysis-lemmagen/releases/download/v8.6.1/elasticsearch-analysis-lemmagen-8.6.1-plugin.zip

COPY elasticsearch.yml /usr/share/elasticsearch/config/

EXPOSE 9200

ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"
