FROM jboss/keycloak-postgres:2.3.0.Final

MAINTAINER IvoNet <webmaster@ivonet.nl>

WORKDIR /opt/jboss

# modifying standalone.xml to wire in proxy redirects
RUN sed -i -e 's|<http-listener name="default" socket-binding="http" redirect-socket="https"/>|<http-listener name="default" socket-binding="http" proxy-address-forwarding="true" redirect-socket="proxy-https"/>|' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's|<socket-binding name="https" port="${jboss.https.port:8443}"/>|&\n        <socket-binding name="proxy-https" port="443"/>|' $JBOSS_HOME/standalone/configuration/standalone.xml


