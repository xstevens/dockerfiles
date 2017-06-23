FROM ubuntu:16.04
MAINTAINER Xavier Stevens <xavier.stevens@gmail.com>

USER root

# Base packages
RUN apt-get update && apt-get -y install curl git nmap postgresql sudo tmux

WORKDIR /tmp

# Install Metasploit with Rapid7 install script
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && ./msfinstall

# Install exploit-database
RUN git clone https://github.com/offensive-security/exploit-database.git /opt/exploit-database && \
    ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit

# Install ripgrep
RUN curl -L -O https://github.com/BurntSushi/ripgrep/releases/download/0.5.2/ripgrep-0.5.2-x86_64-unknown-linux-musl.tar.gz && \
    tar xvzf ripgrep-0.5.2-x86_64-unknown-linux-musl.tar.gz && \
    cp /tmp/ripgrep-0.5.2-x86_64-unknown-linux-musl/rg /usr/local/bin/

# Add findsploit script
ADD findsploit.sh /usr/local/bin/findsploit

# create msf user
RUN /usr/sbin/useradd msf
RUN /usr/sbin/usermod -aG sudo msf
RUN echo "msf:toor" | chpasswd

# switch to msf user
USER msf
WORKDIR /home/msf

# settings and custom scripts folder
VOLUME /home/msf/.msf4/
VOLUME /tmp/data/
