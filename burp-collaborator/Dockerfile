FROM openjdk:8-slim
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

# Base packages
RUN apt-get update && apt-get install -y --no-install-recommends\
    ca-certificates \
    wget \
&& rm -rf /var/lib/apt/lists/*

# setup confd
RUN wget -O /bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.14.0/confd-0.14.0-linux-amd64 && \
    chmod +x /bin/confd && \
    mkdir -p /etc/confd/{conf.d, templates}

# add burp user
RUN /usr/sbin/useradd burp

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
RUN chown -R burp /burp

WORKDIR /burp
EXPOSE 8025 8053 8080 8443 8465 8587 9090 9443
USER burp
CMD [ "/burp/run.sh" ]
