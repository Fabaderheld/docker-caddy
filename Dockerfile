FROM alpine:3.12.3
RUN apk update
RUN apk add --no-cache tzdata
ADD https://caddyserver.com/api/download?os=linux&arch=arm&arm=7&p=github.com%2Fcaddy-dns%2Fhetzner&idempotency=20397297580339 /usr/bin/caddy
RUN chmod +x /usr/bin/caddy

EXPOSE 80/tcp 443/tcp
VOLUME [ "/config", "/www" ]
#COPY root/ /
COPY Caddyfile /config/
CMD /usr/bin/caddy run -config /config/Caddyfile
