FROM debian:stretch-slim
LABEL maintainer="Xavier Stevens"

ENV SECURITY_MONKEY_VERSION=v0.9.2 \
    SECURITY_MONKEY_SETTINGS=/usr/local/src/security_monkey/env-config/config-docker.py

RUN mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && \
    apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    ca-certificates \
    gcc \
    git \
    libffi-dev \
    libpq-dev \
    libssl-dev \
    libyaml-dev \
    postgresql \
    postgresql-client \
    python \
    python-dev \
    python-pip

RUN useradd -m -d /home/secmonkey -s /bin/sh secmonkey

RUN git clone -b $SECURITY_MONKEY_VERSION https://github.com/Netflix/security_monkey.git /usr/local/src/security_monkey

RUN pip install --upgrade pip setuptools && \
    cd /usr/local/src/security_monkey && python setup.py install

VOLUME /var/log/security_monkey

USER secmonkey
WORKDIR "/usr/local/src/security_monkey"
EXPOSE 5000

ENTRYPOINT ["/usr/bin/python", "/usr/local/src/security_monkey/security_monkey/manage.py"]
CMD ["run_api_server", "-b", "0.0.0.0:5000"]
