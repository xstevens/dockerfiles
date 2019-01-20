FROM python:2.7-slim-stretch
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

RUN mkdir /src
VOLUME /src
WORKDIR /src

CMD ["/app/run.sh"]