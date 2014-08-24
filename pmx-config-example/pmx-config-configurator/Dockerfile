# Panamax configuration example: the configuration container

FROM zanco/apache-php5

MAINTAINER docker@zanconsulting.com

ADD sshid-docker-internal /scripts/sshid-docker-internal

ADD index.php /var/www/html/index.php
ADD step1.php /var/www/html/step1.php
ADD finish.php /var/www/html/finish.php
ADD restore-proxy.php /var/www/html/restore-proxy.php

COPY scripts /scripts
RUN chown -R www-data:www-data /scripts

ADD onboot.sv.conf /etc/supervisor/conf.d/haproxy.sv.conf
