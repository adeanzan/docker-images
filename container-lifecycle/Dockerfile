#
# Manages the lifecycle of other containers:
#   - starts containers in the correct order on boot
#   - manages container versions and applies upgrades
#

FROM zanconsulting/base

#
# PHP and Apache 
#
EXPOSE 80
RUN echo "[+++++ Start: installing PHP/Apache +++++]" \    
    && add-apt-repository -y ppa:ondrej/php5-5.6 \
    && apt-get update \
    && apt-get install -y \                
        php5 \
        php5-curl \                
        php5-json \        
        php5-sqlite \
    \
    && rm -f /var/www/html/index.html \    
    && echo "[+++++ End: installing PHP/Apache +++++]" 

COPY init.d/50-apache.sh /etc/my_init.d/

#
# Additional packages
#
RUN echo "[+++++ Start: installing additional packages +++++]" \    
    && apt-get install -y \
        bash-completion \
        docker.io \
    \
    && ln -sf /usr/bin/docker.io /usr/local/bin/docker \
    && echo "[+++++ End: installing additional packages +++++]" 
