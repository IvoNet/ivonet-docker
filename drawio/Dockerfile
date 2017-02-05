FROM ubuntu:17.04

MAINTAINER IvoNet <webmaster@ivonet.nl>

RUN apt-get update && \
    apt-get -y install apache2 git &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
    git clone --depth=1 https://github.com/jonberenguer/draw.io.git && \
    rm -rf /var/www/html && \
    ln -s /opt/draw.io/war/ /var/www/html

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]