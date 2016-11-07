FROM babim/alpinebase:edge

RUN apk add --no-cache mongodb && \
    rm /usr/bin/mongosniff /usr/bin/mongoperf

VOLUME /data/db
EXPOSE 27017 28017

COPY run.sh /run.sh
ENTRYPOINT [ "/run.sh" ]
CMD [ "mongod" ]
