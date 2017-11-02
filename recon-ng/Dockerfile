FROM python:2.7-slim-stretch
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

# base packages
RUN apt-get update && apt-get install -y --no-install-recommends\
    ca-certificates \
    git \
    tmux \
&& rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# create recon user
RUN /usr/sbin/useradd recon

WORKDIR /home/recon

# install recon-ng
RUN git clone https://github.com/xstevens/recon-ng.git
RUN cd recon-ng && pip install -r requirements.txt

# install Sublist3r (this also is available as a module in my fork of recon-ng)
RUN git clone https://github.com/aboul3la/Sublist3r.git
RUN cd Sublist3r && pip install -r requirements.txt

# install theHarvester
RUN git clone https://github.com/laramies/theHarvester.git

# recon-ng data volume
RUN mkdir /home/recon/.recon-ng
RUN chown -R recon:recon /home/recon
VOLUME /home/recon/.recon-ng/

# switch to recon user
USER recon

# just a suggestion, use /bin/bash if you want to drop into bash or tmux
CMD ["/home/recon/recon-ng/recon-ng"]
