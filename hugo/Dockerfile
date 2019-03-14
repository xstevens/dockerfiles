FROM node:10.15-stretch-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		gnupg \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV HUGO_VERSION 0.53

WORKDIR /opt/hugo    
RUN set -x && \
	curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
    curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_checksums.txt" && \
    grep "hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz" "hugo_extended_${HUGO_VERSION}_checksums.txt" | sha256sum --status -c && \
    tar xvzf "hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
	rm "hugo_extended_${HUGO_VERSION}_checksums.txt" "hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
ENV PATH "/opt/hugo:${PATH}"

RUN npm install -g postcss-cli autoprefixer

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME
USER user

EXPOSE 1313
VOLUME /src
WORKDIR /src

CMD ["/opt/hugo/hugo", "server", "--bind", "0.0.0.0", "-D"]
