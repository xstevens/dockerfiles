FROM debian:latest
MAINTAINER Xavier Stevens <xavier.stevens@gmail.com>

# Base packages
RUN apt-get update && apt-get install -y --no-install-recommends\
        ca-certificates \
        git \
        python \
        python-pip \
        python-setuptools \
        python-wheel \
        sudo \
        tmux \
    && rm -rf /var/lib/apt/lists/*

# create recon user
RUN /usr/sbin/useradd recon
RUN /usr/sbin/usermod -aG sudo recon
RUN echo "recon:toor" | chpasswd

WORKDIR /home/recon

# Install recon-ng
RUN git clone https://github.com/xstevens/recon-ng.git
RUN cd recon-ng && pip install -r requirements.txt

# Install Sublist3r (this also is available as a module in my fork of recon-ng)
RUN git clone https://github.com/aboul3la/Sublist3r.git
RUN cd Sublist3r && pip install -r requirements.txt

# Install theHarvester
RUN git clone https://github.com/laramies/theHarvester.git

# recon-ng data volume
RUN mkdir /home/recon/.recon-ng
RUN chown -R recon:recon /home/recon
VOLUME /home/recon/.recon-ng/

# switch to recon user
USER recon

# just a suggestion, use /bin/bash if you want to drop into bash or tmux
WORKDIR /home/recon/recon-ng
CMD ["/home/recon/recon-ng/recon-ng"]
