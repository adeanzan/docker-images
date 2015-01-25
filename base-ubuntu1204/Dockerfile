# Base image using ubuntu 12.04 instead of phusion's default 14.04
# zanconsulting/base-ubuntu1204

FROM wwestenbrink/baseimage-ubuntu-12:0.9.12

# Standard utilities
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common python-software-properties

# Update system and run basic configuration
RUN locale-gen en_US.UTF-8

# Support utf-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8



# Set up standard SSH key
ADD id_zan_docker.pub /tmp/id_zan_docker.pub
RUN mkdir -p /root/.ssh
RUN cat /tmp/id_zan_docker.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Expose ports
EXPOSE 22
