FROM babim/debianbase:9
ENV OSDEB stretch

# option run
RUN apt-get update && \
    apt-get install -y wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh

# Allow build-time overrides (eg. to build image with MongoDB Enterprise version)
# Options for MONGO_PACKAGE: mongodb-org OR mongodb-enterprise
# Options for MONGO_REPO: repo.mongodb.org OR repo.mongodb.com
# Example: docker build --build-arg MONGO_PACKAGE=mongodb-enterprise --build-arg MONGO_REPO=repo.mongodb.com .
ENV MONGO_PACKAGE mongodb-org
ENV MONGO_REPO repo.mongodb.org
ENV MONGO_MAJOR 4.1
ENV MONGO_VERSION 4.1.2

# install
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20Mongodb%20install/mongodb_install.sh | bash

# volume
VOLUME /data/db /data/configdb
# entrypoint
ENTRYPOINT ["start.sh"]
# port
EXPOSE 27017
# startup
CMD ["supervisord", "-nc", "/etc/supervisor/supervisord.conf"]