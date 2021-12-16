FROM node:lts-alpine
LABEL maintainer="Xavier Stevens"

# Installs latest Chromium package.
RUN apk update && apk upgrade && \
    apk add --no-cache chromium && \
    # echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    # echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    # apk add --no-cache \
    #   chromium@edge \
    #   nss@edge
    rm -rf /var/cache/apk/*

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Add puppeteer
RUN yarn add puppeteer@v12.0.1

RUN adduser -s /bin/sh -D puppeteer && \
    mkdir -p /home/puppeteer/Downloads && \
    chown -R puppeteer:puppeteer /home/puppeteer

VOLUME /screenshots

# Run everything after as non-privileged user.
USER puppeteer

CMD ["/bin/sh"]
