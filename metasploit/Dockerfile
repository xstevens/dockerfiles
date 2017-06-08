FROM ubuntu:16.04
MAINTAINER Xavier Stevens <xavier.stevens@gmail.com>

USER root

# Base packages
RUN apt-get update && apt-get -y install curl nmap postgresql sudo

# Install Metasploit with Rapid7 install script
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && ./msfinstall

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
