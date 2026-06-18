FROM debian:trixie-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

RUN echo "deb-src http://deb.debian.org/debian trixie main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        gcc \
        gcc-arm-linux-gnueabihf \
        g++-arm-linux-gnueabihf \
        libc6-dev \
        #openssl \
        #libssl-dev \
        pkg-config
        # pkg-config-arm-linux-gnueabi \
        # pkg-config-arm-linux-gnueabihf
    # && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.cargo/bin
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ADD ./cargo/config /root/.cargo/config
ADD ./init.sh /root/init.sh

RUN PATH="$PATH:/root/.cargo/bin" rustup target add armv7-unknown-linux-gnueabihf

VOLUME /src
WORKDIR /src

ENV PATH="$PATH:/root/.cargo/bin"

CMD ["/root/init.sh"]
