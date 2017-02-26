FROM alpine:edge

RUN apk --no-cache add squid tor privoxy ca-certificates && \
    ln -sf /dev/stdout /var/log/privoxy/logfile && \
    chown -R squid:squid /var/cache/squid && \
    chown -R squid:squid /var/log/squid

COPY service /opt/

EXPOSE 8888

CMD ["/bin/sh", "/opt/start.sh"]
