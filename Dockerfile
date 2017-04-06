FROM quay.io/dimdm/node

ARG KIBANA_VERSION=5.3.0
ARG KIBANA_PATH=/kibana

RUN apk --no-cache add --virtual build-dependencies \
      python \
      git &&\
    git clone https://github.com/ddm/kibana.git ${KIBANA_PATH} &&\
    cd ${KIBANA_PATH} &&\
    git checkout v${KIBANA_VERSION} &&\
    npm install &&\
    npm run build &&\
    apk del --purge build-dependencies &&\
    rm -rf /var/cache/apk/* &&\
    adduser -D -u 1000 kibana &&\
    find ${KIBANA_PATH} -print | xargs chown kibana:kibana
