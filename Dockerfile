FROM alpine
RUN apk add --no-cache tzdata
ADD https://caddyserver.com/api/download?os=linux&arch=arm&arm=7&idempotency=93119246464169 /usr/bin/caddy
RUN chmod +x /usr/bin/caddy

EXPOSE 80/tcp 443/tcp
VOLUME [ "/config", "/www" ]
#COPY root/ /
COPY Caddyfile /config/
CMD /usr/bin/caddy -agree -conf /config/Caddyfile -log stdout -root /tmp