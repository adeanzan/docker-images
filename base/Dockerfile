# Base image for all Zan images
# zanconsulting/base

# release date: 2015-01-20
FROM phusion/baseimage:0.9.16

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
RUN echo "[+++++ Adding SSH key +++++]" \
    && rm -f /etc/service/sshd/down \
    && mkdir -p /root/.ssh \
    && cat /tmp/id_zan_docker.pub >> /root/.ssh/authorized_keys \
    && chmod 600 /root/.ssh/authorized_keys \
    && echo "[+++++ SSH key added +++++]" \


# Expose ports
EXPOSE 22
