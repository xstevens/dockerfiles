FROM nginx:1.13.5
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

ENV SECURITY_MONKEY_VERSION=v0.9.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    gnupg

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list && \
    apt-get update && \
    apt-get install -y -q dart \
&& rm -rf /var/lib/apt/lists/*

RUN git clone -b $SECURITY_MONKEY_VERSION https://github.com/Netflix/security_monkey.git /usr/local/src/security_monkey

RUN cd /usr/local/src/security_monkey/dart && \
    /usr/lib/dart/bin/pub get && \
    /usr/lib/dart/bin/pub build && \
    mkdir -p /usr/local/src/security_monkey/security_monkey/static/ && \
    cp -R /usr/local/src/security_monkey/dart/build/web/* /usr/local/src/security_monkey/security_monkey/static/

RUN rm /etc/nginx/conf.d/default.conf
ADD ssl /etc/nginx/ssl

WORKDIR /etc/nginx
EXPOSE 8080 8443

ADD conf.d/securitymonkey.conf /etc/nginx/conf.d/securitymonkey.conf
COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
