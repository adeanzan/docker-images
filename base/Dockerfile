# Base image for all Zan images

# release date: 2014-10-03
FROM phusion/baseimage:0.9.15

# Update system and run basic configuration
RUN apt-get update
RUN apt-get upgrade -y
RUN locale-gen en_US.UTF-8

# Standard utilities
RUN apt-get install -y software-properties-common python-software-properties

# Set up standard SSH key
ADD id_zan_docker.pub /tmp/id_zan_docker.pub
RUN mkdir -p /root/.ssh
RUN cat /tmp/id_zan_docker.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Expose ports
EXPOSE 22
