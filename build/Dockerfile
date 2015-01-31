#
# Utility container for building source code
#

FROM zanconsulting/base

# Additional packages for compiling software
RUN echo "[+++++ Start: additional packages +++++]" \  
    && apt-get update \    
    && apt-get install -y \
        autoconf \
        bash-completion \
        build-essential \        
        git \
        mercurial \        
        libpcre3-dev \
        libssl-dev \
        linux-headers-generic \
        subversion \
        unzip \
        wget \
    \
    && mkdir -p /var/src \
    && echo "cd /var/src" >> ~/.profile \
    && echo "[+++++ End  : additional packages +++++]" 
