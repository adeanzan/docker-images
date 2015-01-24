# Base image for all Zan images
# zanconsulting/base

# release date: 2014-10-03
FROM phusion/baseimage:0.9.15

# Configure APT to run without a terminal
ENV DEBIAN_FRONTEND noninteractive

# UTF-8 support
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Update system and run basic configuration
RUN apt-get update \
    && apt-get upgrade -y \
    && locale-gen en_US.UTF-8 \
    && apt-get install -y \
        software-properties-common \
        python-software-properties 
    


# Set up standard SSH key
ADD id_zan_docker.pub /tmp/id_zan_docker.pub
RUN mkdir -p /root/.ssh \
    && cat /tmp/id_zan_docker.pub >> /root/.ssh/authorized_keys \
    && chmod 600 /root/.ssh/authorized_keys


# Expose ports
EXPOSE 22
