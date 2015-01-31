#
# -v /var/nfs-mounts/git-containers/checkouts/stash/lims-symfony:/var/www/Symfony \
docker-dev.sh \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -p 53:8600 \
    -p 53:8600/udp \
    --
