FROM ubuntu:16.04
MAINTAINER Xavier Stevens <xavier.stevens@gmail.com>

RUN apt-get update && apt-get install -y curl bzip2
RUN curl -O http://dl.4players.de/ts/releases/3.0.13.6/teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2

RUN mkdir -p /opt/teamspeak3
RUN tar xvjf teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2 -C /opt/teamspeak3 --strip-components=1

WORKDIR /opt/teamspeak3
EXPOSE 9987
ENV LD_LIBRARY_PATH /opt/teamspeak3:${LD_LIBRARY_PATH}
ENTRYPOINT ["/opt/teamspeak3/ts3server"]
