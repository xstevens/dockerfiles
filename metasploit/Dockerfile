FROM debian:buster-slim
LABEL maintainer="Xavier Stevens <xavier.stevens@gmail.com>"

# Base packages
RUN mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-utils \
        ca-certificates \
        curl \
        git \
        gnupg \
        nmap \
        postgresql \
        tmux \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# Install Metasploit with Rapid7 install script
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && ./msfinstall

# Install exploit-database
RUN git clone https://github.com/offensive-security/exploit-database.git /opt/exploit-database && \
    ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit

# Install ripgrep
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb && \
    dpkg -i ripgrep_0.10.0_amd64.deb

# Add findsploit script
COPY findsploit.sh /usr/local/bin/findsploit
RUN chmod 755 /usr/local/bin/findsploit

# create msf user
RUN /usr/sbin/useradd msf

# switch to msf user
USER msf
WORKDIR /home/msf

# settings and custom scripts folder
VOLUME /home/msf/.msf4/
VOLUME /tmp/data/

# just a suggestion, use /bin/bash if you want to drop into bash or tmux
CMD ["/usr/bin/msfconsole"]
