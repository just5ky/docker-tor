# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-selkies:debianbookworm

ARG BUILD_DATE
ARG VERSION

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="docker-tor" \
      org.opencontainers.image.description="Tor Browser in a containerised desktop via Selkies" \
      org.opencontainers.image.url="https://github.com/just5ky/docker-tor" \
      org.opencontainers.image.source="https://github.com/just5ky/docker-tor" \
      org.opencontainers.image.licenses="GPL-3.0-only" \
      org.opencontainers.image.version="${VERSION}" \
      maintainer="justsky"

ENV TITLE="Tor Browser" \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      tor \
      torbrowser-launcher && \
    apt-get clean && \
    rm -rf \
      /var/lib/apt/lists/* \
      /var/tmp/* \
      /tmp/*

COPY /base/ /

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -fsSL http://localhost:3000/ > /dev/null || exit 1

EXPOSE 3000
EXPOSE 3001

VOLUME /config
