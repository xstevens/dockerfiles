FROM python:3.14-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive
ARG UV_VERSION=0.9.15
ARG SYSTEM_ARCH=aarch64

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gcc \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# add uv
RUN cd /tmp && \
    ARCH=$(uname -m) \
    curl -Lf -O https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-${SYSTEM_ARCH}-unknown-linux-gnu.tar.gz && \
    tar xvzf uv-${SYSTEM_ARCH}-unknown-linux-gnu.tar.gz && \
    cp /tmp/uv-${SYSTEM_ARCH}-unknown-linux-gnu/uv /usr/local/bin/ && \
    cp /tmp/uv-${SYSTEM_ARCH}-unknown-linux-gnu/uvx /usr/local/bin/

# add run script
ADD run.sh /app/run.sh

# add user
RUN useradd -s /sbin/nologin -m -u 10000 -U user

# setup /src volume mount
RUN mkdir /src && chown user:user /src
VOLUME /src
WORKDIR /src

USER user

CMD ["/app/run.sh"]
