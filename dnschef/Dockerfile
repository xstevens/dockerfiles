FROM debian:stable
MAINTAINER Xavier Stevens <xavier.stevens@gmail.com>

# Base packages
RUN apt-get update && apt-get install -y \
    git \
    sudo \
    tmux \
    python \
    python-pip \
&& rm -rf /var/lib/apt/lists/*

# Install dnschef
RUN git clone https://github.com/iphelix/dnschef.git /opt/dnschef
WORKDIR /opt/dnschef
RUN pip install dnslib IPy

# Expose DNS port
EXPOSE 53

ENTRYPOINT ["/opt/dnschef/dnschef.py", "-p", "53"]
CMD ["--fakedomains=*.evilcorp.com", "--fakeip=127.0.0.1"]
