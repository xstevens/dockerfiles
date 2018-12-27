FROM node:10.15

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		gnupg \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

WORKDIR /opt/hugo    
RUN curl -LO https://github.com/gohugoio/hugo/releases/download/v0.53/hugo_extended_0.53_Linux-64bit.tar.gz && \
    curl -LO https://github.com/gohugoio/hugo/releases/download/v0.53/hugo_extended_0.53_checksums.txt && \
    grep 'hugo_extended_0.53_Linux-64bit.tar.gz' hugo_extended_0.53_checksums.txt | sha256sum --status -c && \
    tar xvzf hugo_extended_0.53_Linux-64bit.tar.gz
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
