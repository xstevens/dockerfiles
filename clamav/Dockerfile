FROM debian:buster-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		clamav \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME
WORKDIR $HOME
USER user

VOLUME "/mnt"

CMD ["/bin/bash"]
