ARG REGISTRY=ghcr.io
ARG REPO_OWNER=imagenetmit

FROM ${REGISTRY}/${REPO_OWNER}/uosserver:0.0.54-multiarch

ARG REPO_OWNER

LABEL org.opencontainers.image.source="https://github.com/${REPO_OWNER}/unifi-os-server"

ENV UOS_SERVER_VERSION="5.0.8"

STOPSIGNAL SIGRTMIN+3

COPY uos-entrypoint.sh /root/uos-entrypoint.sh

RUN ["chmod", "+x", "/root/uos-entrypoint.sh"]
ENTRYPOINT ["/root/uos-entrypoint.sh"]
