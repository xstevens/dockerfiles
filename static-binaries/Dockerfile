FROM debian:buster-slim

LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc \
    g++ \
    git \
    make \
    wget \
&& rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# add user
RUN useradd -s /sbin/nologin -m -u 10000 -U user

# setup /output volume mount
RUN mkdir /output && chown user:user /output
VOLUME /output
WORKDIR /tmp

USER user

ADD build.sh /tmp/build.sh

CMD ["/bin/bash"]
