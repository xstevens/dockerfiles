FROM debian:buster-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends\
        ca-certificates \
        curl \
        bzip2 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV TEAMSPEAK_VERSION 3.5.1

RUN curl -O "https://files.teamspeak-services.com/releases/server/${TEAMSPEAK_VERSION}/teamspeak3-server_linux_amd64-${TEAMSPEAK_VERSION}.tar.bz2"

RUN mkdir -p /teamspeak && \
    tar xvjf "teamspeak3-server_linux_amd64-${TEAMSPEAK_VERSION}.tar.bz2" -C /teamspeak --strip-components=1

# add user
RUN useradd user && \
    chown -R user /teamspeak

WORKDIR /teamspeak
ENV LD_LIBRARY_PATH /teamspeak:${LD_LIBRARY_PATH}
EXPOSE 9987
USER user

ENTRYPOINT ["/teamspeak/ts3server"]
