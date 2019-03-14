FROM debian:buster-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		python \
		python-pip \
		tmux \
		weechat \
		weechat-lua \
		weechat-perl \
		weechat-python \
		weechat-plugins \
		weechat-scripts \
		weechat-tcl \
	&& rm -rf /var/lib/apt/lists/*

# for wee-slack
RUN pip install websocket-client

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user
WORKDIR $HOME
VOLUME /home/user/.weechat/

USER user
CMD ["weechat"]