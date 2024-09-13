FROM python:3.12-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

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
    curl -Lf -O https://github.com/astral-sh/uv/releases/download/0.4.9/uv-x86_64-unknown-linux-gnu.tar.gz && \
    tar xvzf uv-x86_64-unknown-linux-gnu.tar.gz && \
    cp /tmp/uv-x86_64-unknown-linux-gnu/uv /usr/local/bin/ && \
    cp /tmp/uv-x86_64-unknown-linux-gnu/uvx /usr/local/bin/

ADD run.sh /app/run.sh
RUN chmod +x /app/run.sh

# add user
RUN useradd -s /sbin/nologin -m -u 10000 -U user

# setup /src volume mount
RUN mkdir /src && chown user:user /src
VOLUME /src
WORKDIR /src

USER user

CMD ["/app/run.sh"]
