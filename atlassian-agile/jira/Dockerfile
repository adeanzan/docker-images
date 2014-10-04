# Atlassian Apps: Jira

FROM zanco/atlassian-base

# Install jira
ADD installers/atlassian-jira-6.3.4-x64.bin /root/atlassian-jira-6.3.4-x64.bin
ADD responses/jira.response.varfile /root/jira.response.varfile

RUN chmod +x /root/atlassian-jira-6.3.4-x64.bin
RUN /root/atlassian-jira-6.3.4-x64.bin -q -varfile jira.response.varfile

# Clean up
RUN rm /root/atlassian-jira-6.3.4-x64.bin

# expose jira port
EXPOSE 8080

# Use supervisord to manage what containers run
ADD init.d/jira.sh /etc/my_init.d/jira.sh

# Add mysql driver
ADD mysql-connector-java-5.1.32-bin.jar /opt/atlassian/jira/lib/

CMD "/sbin/my_init"

# Clean up when done
RUN rm /opt/atlassian/jira/work/catalina.pid
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
