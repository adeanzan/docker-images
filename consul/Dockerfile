#
# Consul server or agent
#
# todo: add recursor flag
#

FROM zanconsulting/base

#
# Ports
# 

# server RPC
EXPOSE 8300
# Serf LAN
EXPOSE 8301
EXPOSE 8301/udp
# Serf WAN
EXPOSE 8302
EXPOSE 8302/udp
# CLI RPC
EXPOSE 8400
# HTTP API
EXPOSE 8500
# DNS
EXPOSE 8600
EXPOSE 8600/udp

#
# Volumes
#
VOLUME /var/consul

#
# Consul binary and configuration
#
COPY resources/consul-latest /usr/bin/consul

COPY init.d/* /etc/my_init.d/
COPY etc/consul/* /etc/consul/

#
# Default environment variables
#
ENV CONSUL_DC="private"