FROM alpine:3.20

ENV TERRARIA_VERSION="latest" \
    TERRARIA_DIR="/root/.local/share/Terraria" \
    TERRARIA_PORT="7777" \
    SERVER_PASSWORD="" \
    SERVER_PASSWORD_FILE=""

COPY --chown=root:root --chmod=755 ./scripts/*.sh /usr/local/bin/
COPY --chown=root:root ./defaults.conf "${TERRARIA_DIR}/server-config.conf"

RUN true \
    && apk add --no-cache curl unzip bash \
    && mkdir -p "${TERRARIA_DIR}" \
    && /usr/local/bin/get_tvs.sh \
    && chmod +x "${TERRARIA_DIR}/TerrariaServer.bin.x86_64" \
    ;

EXPOSE "${TERRARIA_PORT}"
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
