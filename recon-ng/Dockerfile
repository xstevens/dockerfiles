FROM python:2.7-slim-stretch
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

# base packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        tmux \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# create recon user
RUN useradd user

WORKDIR /home/user

# install recon-ng
RUN git clone https://github.com/xstevens/recon-ng.git /recon-ng
RUN cd /recon-ng && pip install -r requirements.txt

# install theHarvester
RUN git clone https://github.com/laramies/theHarvester.git /harvester

# recon-ng data volume
RUN mkdir /home/user/.recon-ng && \
    chown -R user:user /home/user
VOLUME /home/user/.recon-ng/

# switch to recon user
USER user

# just a suggestion, use /bin/bash if you want to drop into bash or tmux
CMD ["/recon-ng/recon-ng"]
