#
# Common container settings for all Zan images
#
# zanconsulting/base

# release date: 2015-01-20
FROM phusion/baseimage:0.9.16

# Configure APT to run without a terminal
ENV DEBIAN_FRONTEND noninteractive

# UTF-8 support
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Update system and run basic configuration
RUN echo "[+++++ Start: installing basic packages +++++]" \
    && apt-get update \
    && apt-get upgrade -y \
    && locale-gen en_US.UTF-8 \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        python-software-properties \
        software-properties-common \
    && echo "[+++++ End  : installing basic packages +++++]"
