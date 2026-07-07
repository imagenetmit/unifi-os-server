ARG REGISTRY=ghcr.io
ARG REPO_OWNER=imagenetmit

FROM ${REGISTRY}/${REPO_OWNER}/uosserver:02cb044f5ed2-multiarch

ARG REPO_OWNER

LABEL org.opencontainers.image.source="https://github.com/${REPO_OWNER}/unifi-os-server"

ENV container="docker"
ENV APP_VERSION="5.1.19"
ENV APP_MODEL="UOSSERVER"
ENV PRODUCT_NAME="UniFi OS Server"

STOPSIGNAL SIGRTMIN+3

COPY uos-entrypoint.sh /root/uos-entrypoint.sh

RUN ["chmod", "+x", "/root/uos-entrypoint.sh"]
ENTRYPOINT ["/root/uos-entrypoint.sh"]
