#!/bin/sh
CONTAINER=traefik
# Starts a wireguard container that is deleted after it is stopped.
# All configs stored in /mnt/data/wireguard
if podman container exists ${CONTAINER}; then
  podman start ${CONTAINER}
else
  podman run -i -d --name ${CONTAINER} \
    -v /mnt/data/traefik:/etc/traefik \
    -p 81:80 \
    -p 444:443 \
    -p 8181:8080 \
    traefik:v2.4
fi

