FROM docker.elastic.co/kibana/kibana:5.2.2

ADD kibana.yml /usr/share/kibana/config/kibana.yml

VOLUME /usr/share/kibana/data/
EXPOSE 5601
