FROM debian:buster-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

# Base packages
RUN mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        openjdk-11-jre-headless \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# setup confd
RUN curl -L -o /bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
    echo "255d2559f3824dd64df059bdc533fd6b697c070db603c76aaf8d1d5e6b0cc334 /bin/confd" | sha256sum -c && \
    chmod +x /bin/confd && \
    mkdir -p /etc/confd/{conf.d, templates}

# setup Java
# RUN curl -LO 'https://d3pxv6yz143wms.cloudfront.net/8.232.09.1/java-1.8.0-amazon-corretto-jdk_8.232.09-1_amd64.deb' && \
#     echo "88ea4a5a1dbdf8b11437cf945552f14c java-1.8.0-amazon-corretto-jdk_8.232.09-1_amd64.deb" | md5sum -c && \
#     dpkg -i java-1.8.0-amazon-corretto-jdk_8.232.09-1_amd64.deb

# setup a Burp Suite directory
RUN mkdir -p /burp

# download Burp Suite (useful for free users)
RUN curl -L -o /burp/burpsuite.jar 'https://portswigger.net/burp/releases/download?product=community&version=2.1.04&type=jar&componentid=100' && \
    echo "795ce10638fb289144c6882ef10c5c1007ed6b428b41667455267b3aefa2f8eb /burp/burpsuite.jar" | sha256sum -c

# copy Burp Suite JAR (useful for pro users)
# COPY burpsuite_pro.jar /burp/burpsuite.jar

# copy Burp Collaborator configuration
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates
COPY certs /burp/certs
# copy run script
COPY run.sh /burp/run.sh

# add user
RUN useradd -s /sbin/nologin -M -u 10000 -U user

# chown burp directory
RUN chown -R user /burp

WORKDIR /burp
EXPOSE 8025 8053 8080 8443 8465 8587 9090 9443
USER user
CMD [ "/burp/run.sh" ]
