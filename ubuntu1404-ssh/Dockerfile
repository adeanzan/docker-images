# Ubuntu 14.04 with ssh

FROM ubuntu:14.04

MAINTAINER docker@zanconsulting.com

# Environment
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Update system and run basic configuration
RUN apt-get update
RUN apt-get upgrade -y
RUN locale-gen en_US.UTF-8

# Standard utilities
RUN apt-get install -y software-properties-common python-software-properties

# Locale Environment
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Supervisor
RUN apt-get install -y supervisor && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

ADD supervisor.conf /etc/supervisor/supervisor.conf

# Install openssh and enable in supervisor
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
ADD sshd.sv.conf /etc/supervisor/conf.d/sshd.sv.conf

# Expose ssh port
EXPOSE 22

# Authorize the internal key for docker communications
ADD sshid-docker-internal.pub /tmp/sshid-docker-internal.pub
RUN mkdir -p /root/.ssh
RUN cat /tmp/sshid-docker-internal.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Disable password authentication
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

# Use supervisord to manage what containers run
CMD supervisord -c /etc/supervisor/supervisor.conf
