FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add haproxy && \
    rm -rf /var/cache/apk/*

COPY config/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

ENTRYPOINT ["haproxy"]
CMD ["-f", "/usr/local/etc/haproxy/haproxy.cfg"
