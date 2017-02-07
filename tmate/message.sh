#!/bin/sh

RSA=`ssh-keygen -l -f /etc/tmate-keys/ssh_host_rsa_key -E md5 2>&1 | cut -d\  -f 2 | sed s/MD5://`
ECDSA=`ssh-keygen -l -f /etc/tmate-keys/ssh_host_ecdsa_key -E md5 2>&1 | cut -d\  -f 2 | sed s/MD5://`
echo Add this to your ~/.tmate.conf file
echo set -g tmate-server-host ${HOST:-<server ip/hostname>}
echo set -g tmate-server-port ${PORT:-<server port>}
echo set -g tmate-server-rsa-fingerprint   \"$RSA\"
echo set -g tmate-server-ecdsa-fingerprint   \"$ECDSA\"
echo set -g tmate-identity \"\"              # Can be specified to use a different SSH key.

touch /tmp/message.sh
