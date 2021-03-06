# -----------------------------------------------------------------------------
# docker-minecraft
#
# Builds a basic docker image that can run a Minecraft server
# (http://minecraft.net/).
#
# Authors: Isaac Bythewood UPDATED by: Joe Beaudry
# Updated: Jul 27th, 2015
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------



# Base system is the LTS version of Ubuntu.
FROM   ubuntu:14.04


# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive


# Download and install everything from the repos.
RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common openssh-server supervisor
RUN    sudo apt-add-repository --yes ppa:webupd8team/java; apt-get --yes update
RUN    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
       echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
       apt-get --yes install curl oracle-java8-installer
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

ADD conf/mc.conf /etc/supervisor/conf.d/mc.conf
ADD conf/sshd.conf /etc/supervisor/conf.d/sshd.conf

# Install SSH 
RUN    apt-get --yes install ssh

# Load in all of our config files.
ADD    ./scripts/mcstart.sh /mcstart.sh
ADD    ./scripts/init.sh /init.sh

RUN echo "export VISIBLE=now" >> /etc/profile

# Fix all permissions
RUN    chmod +x /mcstart.sh /init.sh

EXPOSE 22


# 25565 is for minecraft
EXPOSE 25565

# /data contains static files and database
VOLUME ["/data"]

# /start runs it.
CMD ["/init.sh"]
