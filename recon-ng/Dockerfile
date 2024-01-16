FROM python:3.8.0-slim-buster
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

# base packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        gcc \
        git \
        libxml2-dev \
        libxslt1-dev \
        tmux \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# create recon user
RUN useradd -s /sbin/nologin -m -u 10000 -U user

# install recon-ng
ARG RECON_NG_VERSION=v5.0.3
RUN git clone https://github.com/lanmaster53/recon-ng.git /recon-ng && \
    cd /recon-ng && \
    git checkout ${RECON_NG_VERSION} -b pinned && \
    pip install -r REQUIREMENTS

# recon-ng data volume
RUN mkdir /home/user/.recon-ng && \
    chown -R user:user /home/user
VOLUME /home/user/.recon-ng/

# switch to recon user
WORKDIR /recon-ng
USER user

# just a suggestion, use /bin/bash if you want to drop into bash or tmux
CMD ["/recon-ng/recon-ng", "--no-analytics"]
