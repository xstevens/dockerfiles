FROM node:8-slim

RUN apt-get update && apt-get install -y --no-install-recommends\
    ca-certificates \
    chromium \
&& rm -rf /var/lib/apt-lists/*

COPY js /zbrowse/js
COPY zbrowse.sh /zbrowse
RUN chmod +x /zbrowse/zbrowse.sh
RUN cd /zbrowse/js && npm install

WORKDIR /zbrowse
ENTRYPOINT ["/zbrowse/zbrowse.sh"]
