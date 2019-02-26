FROM python:3.7-slim-stretch
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc \
    g++ \
    git \
&& rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# add pip-tools
RUN pip install --upgrade pip && pip install virtualenv pip-tools

ADD run.sh /app/run.sh
RUN chmod +x /app/run.sh

# add user
RUN useradd -s /sbin/nologin -m -u 10000 -U user

# setup /src volume mount
RUN mkdir /src && chown user:user /src
VOLUME /src
WORKDIR /src

USER user

CMD ["/app/run.sh"]