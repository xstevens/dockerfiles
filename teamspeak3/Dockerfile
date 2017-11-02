FROM debian:stretch-slim
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends\
        ca-certificates \
        curl \
        bzip2 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN curl -O http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2

RUN mkdir -p /teamspeak
RUN tar xvjf teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2 -C /teamspeak --strip-components=1

# add teamspeak user
RUN /usr/sbin/useradd teamspeak

# chown teamspeak directory
RUN chown -R teamspeak /teamspeak

WORKDIR /teamspeak
ENV LD_LIBRARY_PATH /teamspeak:${LD_LIBRARY_PATH}
EXPOSE 9987
USER teamspeak

ENTRYPOINT ["/teamspeak/ts3server"]
