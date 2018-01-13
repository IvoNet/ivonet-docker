#!/usr/bin/env bash
## Do your own config stuff here


## this copies our settings.xml to the default place where maven will look for it.
rm -f /usr/share/maven/conf/settings.xml >/dev/null
cp /settings.xml /usr/share/maven/conf/settings.xml

# Always end with this line...
exec "$@"
