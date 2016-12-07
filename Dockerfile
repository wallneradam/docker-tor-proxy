FROM alpine:latest

RUN apk --update add squid tor privoxy && rm -rf /var/cache/apk/* && \
    ln -sf /dev/stdout /var/log/privoxy/logfile && \
    chown -R squid:squid /var/cache/squid && \
    chown -R squid:squid /var/log/squid

COPY service /opt/

EXPOSE 8888

CMD ["/bin/sh", "/opt/start.sh"]
