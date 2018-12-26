FROM debian:buster-slim
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		clamav \
		gnupg \
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
