FROM alpine
ADD https://caddyserver.com/download/linux/arm7?plugins=http.filter,http.ipfilter,http.realip,tls.dns.cloudflare&license=personal&telemetry=off /tmp/caddy.tar
RUN tar -xf /tmp/caddy.tar
RUN cp caddy /usr/bin/caddy
RUN chmod +x /usr/bin/caddy

EXPOSE 80/tcp 443/tcp
VOLUME [ "/config", "/www" ]
#COPY root/ /
COPY Caddyfile /config/
CMD /usr/bin/caddy -agree -conf /config/Caddyfile -log stdout -root /tmp