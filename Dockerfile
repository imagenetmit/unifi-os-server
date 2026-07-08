ARG REGISTRY=ghcr.io
ARG REPO_OWNER=imagenetmit

FROM ${REGISTRY}/${REPO_OWNER}/uosserver:ab51f5e215ae-multiarch

ARG REPO_OWNER

LABEL org.opencontainers.image.source="https://github.com/${REPO_OWNER}/unifi-os-server"

ENV container="docker"
ENV APP_VERSION="5.1.21"
ENV APP_MODEL="UOSSERVER"
ENV PRODUCT_NAME="UniFi OS Server"

STOPSIGNAL SIGRTMIN+3

COPY uos-entrypoint.sh /root/uos-entrypoint.sh

RUN ["chmod", "+x", "/root/uos-entrypoint.sh"]
ENTRYPOINT ["/root/uos-entrypoint.sh"]
