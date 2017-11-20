FROM alpine:3.6
# Maintainer
# ----------
MAINTAINER babim <babim@matmagoc.com>

RUN rm -f /etc/motd && \
    echo "---" > /etc/motd && \
    echo "Support by Duc Anh Babim. Contact: ducanh.babim@yahoo.com" >> /etc/motd && \
    echo "---" >> /etc/motd && \
    touch "/(C) Babim"

# Set timezone
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime \
    && echo "Asia/Ho_Chi_Minh" >  /etc/timezone \
&& apk del tzdata

# install mongodb
RUN apk add --no-cache mongodb && apk upgrade --update && \
    rm -rf /var/cache/apk/*

VOLUME /data/db
EXPOSE 27017 28017

COPY run.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "mongod" ]
