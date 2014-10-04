# Ubuntu 14.04 with ssh

FROM phusion/baseimage:0.9.12

MAINTAINER docker@zanconsulting.com

# Environment
ENV HOME /root

# Update system and run basic configuration
RUN apt-get update
RUN apt-get upgrade -y
RUN locale-gen en_US.UTF-8

# Locale Environment
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Expose ssh port
EXPOSE 22

# Add a default SSH key
ADD sshid-docker-internal.pub /tmp/sshid-docker-internal.pub
RUN mkdir -p /root/.ssh
RUN cat /tmp/sshid-docker-internal.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Disable password authentication
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

