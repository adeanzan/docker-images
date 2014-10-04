# Atlassian Apps: Jira

FROM zanco/atlassian-base

# Install jira
ADD installers/atlassian-confluence-5.5.6-x64.bin /root/atlassian-confluence-5.5.6-x64.bin
ADD responses/confluence.response.varfile /root/confluence.response.varfile

RUN chmod +x /root/atlassian-confluence-5.5.6-x64.bin
RUN /root/atlassian-confluence-5.5.6-x64.bin -q -varfile confluence.response.varfile

# Clean up
RUN rm /root/atlassian-confluence-5.5.6-x64.bin

# expose confluence http port
EXPOSE 8090

# Use supervisord to manage what containers run
ADD init.d/confluence.sh /etc/my_init.d/confluence.sh

# Add mysql driver
ADD mysql-connector-java-5.1.32-bin.jar /opt/atlassian/confluence/lib/

CMD "/sbin/my_init"

# Clean up when done
RUN rm /opt/atlassian/confluence/work/catalina.pid
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
