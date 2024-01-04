FROM docker.elastic.co/elasticsearch/elasticsearch:8.6.1

COPY elasticsearch.yml /usr/share/elasticsearch/config/

RUN bin/elasticsearch-plugin install https://github.com/vhyza/elasticsearch-analysis-lemmagen/releases/download/v8.6.1/elasticsearch-analysis-lemmagen-8.6.1-plugin.zip

USER root
RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/vhyza/lemmagen-lexicons/raw/master/free/lexicons/uk.lem -O /tmp/uk.lem
RUN mkdir -p /etc/elasticsearch/lemmagen /usr/share/elasticsearch/config/lemmagen
RUN cp -b /tmp/uk.lem /etc/elasticsearch/lemmagen
RUN cp -b /tmp/uk.lem /usr/share/elasticsearch/config/lemmagen
USER elasticsearch

EXPOSE 9200
