# Atlassian proxy to redirect apps based on hostname

FROM zanco/ubuntu1404-ssh

MAINTAINER docker@zanconsulting.com

RUN apt-get install haproxy

RUN sed -i -e 's#ENABLED=0#ENABLED=1#' /etc/default/haproxy

ADD haproxy.cfg /etc/haproxy/haproxy.cfg

ADD haproxy.sv.conf /etc/supervisor/conf.d/haproxy.sv.conf

EXPOSE 80
