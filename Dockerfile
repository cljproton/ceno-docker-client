ARG OUINET_VERSION=latest
FROM equalitie/ouinet:${OUINET_VERSION}

RUN mkdir -p /var/opt/ouinet/client

COPY ouinet-client.conf metrics-cert.pem ssl-inj-cert.pem \
     /var/opt/ouinet/client/

EXPOSE 8077/tcp 8078/tcp 28729/udp

ENTRYPOINT ["/opt/ouinet/ouinet", "client"]
