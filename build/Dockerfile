# FROM alpine:3.20
FROM debian:10-slim

ENV TERRARIA_VERSION="1.4.4.9"

COPY --chown=root:root --chmod=755 ./scripts/*.sh /usr/local/bin/

RUN true \
    && apt-get update -y \
    && apt-get install -y unzip curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && /usr/local/bin/install.sh \
    ;

COPY --chown=root:root ./defaults.conf "/opt/terraria/server-config.conf"

WORKDIR /opt/terraria
VOLUME [ "/opt/terraria/worlds" ]

EXPOSE 7777
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
