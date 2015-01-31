#!/usr/bin/env bash

consul agent \
    -server \
    -bootstrap-expect 1 \
    -dc "$CONSUL_DC" \
    -data-dir /var/consul/data \
    -client 0.0.0.0 \
    -config-file /etc/consul/consul.conf \
    --
