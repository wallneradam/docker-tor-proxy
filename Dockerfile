FROM alpine:edge

COPY service /opt/
RUN apk --update add privoxy tor runit && rm -rf /var/cache/apk/* && \
    ln -sf /dev/stdout /var/log/privoxy/logfile

EXPOSE 8888

CMD ["runsvdir", "/opt"]
