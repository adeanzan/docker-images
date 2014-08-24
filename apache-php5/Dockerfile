# Apache with PHP 5
FROM zanco/ubuntu1404-ssh

MAINTAINER docker@zanconsulting.com

RUN add-apt-repository -y ppa:ondrej/php5-oldstable
RUN apt-get update

RUN apt-get install -y php5 php5-mysql php5-curl php5-json php5-curl 

RUN a2enmod vhost_alias

# dir.conf changes to make index.php take priority
ADD apache/mods-available/dir.conf /etc/apache2/mods-available/dir.conf

# Allow easy access to the /var/www/html directory
VOLUME /var/www/html

# Expose port 80
EXPOSE 80

# Enable apache
ADD apache.sv.conf /etc/supervisor/conf.d/apache.sv.conf
