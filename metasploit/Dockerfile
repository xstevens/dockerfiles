FROM debian:buster-slim
LABEL maintainer="Xavier Stevens"

# set DEBIAN_FRONTEND to convey no-TTY during build
ARG DEBIAN_FRONTEND=noninteractive

# Base packages
RUN mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        gnupg \
        nmap \
        postgresql \
        tmux

# Install metasploit-framework
# Functionally equivalent to the steps in:
# https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb
ADD metasploit-rapid7.asc /etc/apt/trusted.gpg.d/
RUN echo -n "deb http://downloads.metasploit.com/data/releases/metasploit-framework/apt buster main" > /etc/apt/sources.list.d/metasploit-framework.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        metasploit-framework \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# Install exploit-database
RUN git clone https://github.com/offensive-security/exploit-database.git /opt/exploit-database && \
    ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit

# Install ripgrep
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb && \
    dpkg -i ripgrep_11.0.2_amd64.deb

# Add findsploit script
COPY findsploit.sh /usr/bin/findsploit
RUN chmod 755 /usr/bin/findsploit

# create msf user
RUN useradd -s /sbin/nologin -M -u 10000 -U msf

# switch to msf user
USER msf
WORKDIR /home/msf

# settings and custom scripts folder
VOLUME /home/msf/.msf4/
VOLUME /tmp/data/

# just a suggestion, use /bin/bash if you want to drop into bash or tmux
CMD ["/usr/bin/msfconsole"]
