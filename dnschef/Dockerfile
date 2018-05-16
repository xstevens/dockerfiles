FROM python:2.7-slim-stretch
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

# base packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
    && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# add dnschef user
RUN useradd dnschef

# install dnschef
RUN git clone https://github.com/iphelix/dnschef.git /dnschef \
    && pip install dnslib IPy \
    && chown -R dnschef /dnschef

WORKDIR /dnschef
EXPOSE 5353
USER dnschef

ENTRYPOINT ["/dnschef/dnschef.py", "-p", "5353"]
CMD ["--fakedomains=*.evilcorp.com", "--fakeip=127.0.0.1"]
