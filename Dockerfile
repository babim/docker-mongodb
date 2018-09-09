FROM babim/alpinebase:3.8
# Maintainer
# ----------
MAINTAINER babim <babim@matmagoc.com>

# install mongodb
RUN apk add --no-cache mongodb && apk upgrade --update && \
    rm -rf /var/cache/apk/*

VOLUME /data/db
EXPOSE 27017 28017

COPY run.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "mongod", "--bind_ip", "0.0.0.0" ]
