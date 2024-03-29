FROM python:3.9-slim-buster
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

# base packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# add user
RUN useradd user

# install dnschef
RUN git clone https://github.com/iphelix/dnschef.git /dnschef \
    && pip install dnslib IPy \
    && chown -R user /dnschef

WORKDIR /dnschef
EXPOSE 5353/tcp
EXPOSE 5353/udp
USER user

ENTRYPOINT ["/dnschef/dnschef.py", "-p", "5353"]
CMD ["--fakedomains=*.example.com", "--fakeip=127.0.0.1"]
