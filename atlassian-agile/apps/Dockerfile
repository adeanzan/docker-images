# Ubuntu 14.04 with ssh

FROM phusion/baseimage:0.9.12

MAINTAINER docker@zanconsulting.com

# Environment
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

# Expose ssh port
EXPOSE 22

# Add a default SSH key
ADD sshid-docker-internal.pub /tmp/sshid-docker-internal.pub
RUN mkdir -p /root/.ssh
RUN cat /tmp/sshid-docker-internal.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# Disable password authentication
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config


# Install jira
ADD atlassian-jira-6.3.4-x64.bin /root/atlassian-jira-6.3.4-x64.bin
ADD responses/jira.response.varfile /root/jira.response.varfile

RUN chmod +x /root/atlassian-jira-6.3.4-x64.bin
RUN /root/atlassian-jira-6.3.4-x64.bin -q -varfile jira.response.varfile

# Clean up
RUN rm /root/atlassian-jira-6.3.4-x64.bin

# Expose atlassian ports:
# jira
EXPOSE 8080

# Use supervisord to manage what containers run
ADD init.d/jira.sh /etc/my_init.d/jira.sh

# Add mysql driver
ADD mysql-connector-java-5.1.32-bin.jar /opt/atlassian/jira/lib/

CMD "/sbin/my_init"

# Clean up when done
RUN rm /opt/atlassian/jira/work/catalina.pid
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
