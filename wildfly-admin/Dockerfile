FROM jboss/wildfly
RUN /opt/jboss/wildfly/bin/add-user.sh admin s3cr3t --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

