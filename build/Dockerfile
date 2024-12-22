FROM alpine:3.20

ENV TERRARIA_VERSION="latest"

COPY --chown=root:root --chmod=755 ./scripts/*.sh /usr/local/bin/
COPY --chown=root:root ./defaults.conf "/opt/terraria/server-config.conf"

RUN true \
    && apk add --no-cache curl unzip bash \
    && /usr/local/bin/install.sh \
    && chmod 755 "/opt/terraria/TerrariaServer.bin.x86_64" \
    && touch -a "/opt/terraria/banlist.txt" \
    ;

WORKDIR /opt/terraria
VOLUME [ "/opt/terraria/worlds" ]

EXPOSE 7777
ENTRYPOINT [ "/opt/terraria/TerrariaServer.bin.x86_64", \
    "-config", "/opt/terraria/server-config.conf" \, \
    "-port", "7777" \
    ]
