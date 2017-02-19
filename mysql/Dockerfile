FROM mysql:5.7.16
MAINTAINER IvoNet <webmaster@ivonet.nl>

ENV TEST_DIR=/testdata

COPY setup/testdata-watcher.sh /usr/local/bin/
COPY setup/vod-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/vod-entrypoint.sh /vod-entrypoint.sh; \
    ln -s /usr/local/bin/testdata-watcher.sh /testdata-watcher.sh; \
    chmod +x /vod-entrypoint.sh /testdata-watcher.sh; \
    apt-get update; \
    apt-get install -y inotify-tools; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


VOLUME ["$TEST_DIR"]
ENTRYPOINT ["ivonet-entrypoint.sh"]
CMD ["mysqld"]