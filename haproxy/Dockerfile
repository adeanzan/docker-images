#
# haproxy container
#
# haproxy version: 1.5.10
#

FROM zanconsulting/base

#
# Ports
#
EXPOSE 80

#
# haproxy binaries
#
COPY haproxy /usr/local/bin/
COPY haproxy-systemd-wrapper /usr/local/bin/

#
# Configure user for this service
#
RUN echo "[+++++ Start: adding user +++++]" \
    && useradd haproxy \
    && usermod --lock haproxy \
    && echo "[+++++ End  : adding user +++++]"

#
# Additional scripts and container setup
#
# syslog configuration
COPY etc/syslog-ng/conf.d/* /etc/syslog-ng/conf.d/

# runit entry
COPY etc/service/haproxy/ /etc/service/haproxy

# haproxy config file
COPY etc/haproxy/haproxy.conf /etc/haproxy/

#RUN echo "[+++++ Start: configuring container +++++]" \
#    && mkdir -p /etc/haproxy \
#    && echo "[+++++ End  : configuring container +++++]"