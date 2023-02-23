FROM headscale/headscale:latest AS headscale
FROM flyio/flyctl:latest AS flyctl
FROM snowdreamtech/frpc:latest AS frpc

FROM debian:stable-slim

RUN apt-get update
RUN apt-get install -y ca-certificates supervisor bash vim

COPY --from=headscale /bin/headscale /headscale
COPY --from=flyctl /flyctl /flyctl
COPY --from=frpc /usr/bin/frpc /frpc

RUN mkdir /etc/{headscale,frpc}

COPY config.yaml /config.yaml
COPY frpc.ini /etc/frpc/frpc.ini
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
COPY acls.hujson /acls.hujson

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
