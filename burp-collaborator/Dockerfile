FROM openjdk:8-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

# Base packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends\
        ca-certificates \
        wget \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# setup confd
RUN wget -O /bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.15.0/confd-0.15.0-linux-amd64 && \
    chmod +x /bin/confd && \
    mkdir -p /etc/confd/{conf.d, templates}

# add user
RUN useradd user

# setup a Burp Suite directory
RUN mkdir -p /burp

# download Burp Suite (useful for free users)
#RUN wget -O /burp/burpsuite.jar 'https://portswigger.net/burp/releases/download?product=free&version=1.7.26&type=jar'
#RUN echo "da3f6386339d1ef3966f8c5598d9b6259d85e4b5ae99fce795198bd73bcfadd4 burpsuite.jar" | sha256sum -c

# copy Burp Suite JAR (useful for pro users)
COPY burpsuite_pro.jar /burp/burpsuite.jar

# copy Burp Collaborator configuration
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates
COPY certs /burp/certs

# copy run script
COPY run.sh /burp/run.sh

# chown burp directory
RUN chown -R user /burp

WORKDIR /burp
EXPOSE 8025 8053 8080 8443 8465 8587 9090 9443
USER user
CMD [ "/burp/run.sh" ]
