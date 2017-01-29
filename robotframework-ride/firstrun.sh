#!/bin/bash

mkdir -p /config/config
ln -s /config/config /nobody/.robotframework
chown -R nobody:users /config
chmod -R g+rw /config
[[ -f /tmp/.X1-lock ]] && rm /tmp/.X1-lock && echo "X1-lock found, deleting"

/sbin/setuser nobody sh -c /nobody &
