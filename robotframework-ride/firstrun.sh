#!/bin/bash

mkdir -p /config/config
ln -s /config/config /nobody/.robotframework
chown -R nobody:users /config
chmod -R g+rw /config
[[ -f /tmp/.X1-lock ]] && rm /tmp/.X1-lock && echo "X1-lock found, deleting"

if [ ! "$EDGE" = "1" ]; then
  echo "EDGE not requested, keeping stable version"
else
  echo "EDGE requested, updating to latest version"
  cd /nobody/RIDE
  git pull
  /usr/bin/python setup.py install
fi

/sbin/setuser nobody sh -c /nobody &
