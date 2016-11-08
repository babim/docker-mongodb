FROM babim/alpinebase:edge

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache mongodb && apk upgrade --update && \
    rm /usr/bin/mongosniff /usr/bin/mongoperf && rm -rf /var/cache/apk/*

VOLUME /data/db
EXPOSE 27017 28017

COPY run.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "mongod" ]
