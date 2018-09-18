FROM babim/debianbase:9
ENV OSDEB stretch

# option run
RUN apt-get update && \
    apt-get install -y wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh

# entrypoint
ENTRYPOINT ["/start.sh"]
# startup
CMD ["supervisord", "-nc", "/etc/supervisor/supervisord.conf"]