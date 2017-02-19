#!/usr/bin/env bash

echo "testdata-watcher started watching $TEST_DIR..."
mysql=( mysql --protocol=socket -uroot -hlocalhost --socket=/var/run/mysqld/mysqld.sock)

if [ ! -z "$MYSQL_ROOT_PASSWORD" ]
then
    mysql+=( -p"${MYSQL_ROOT_PASSWORD}" )
fi

inotifywait -m $TEST_DIR -e create |
    while read path action file; do
        echo "Processing: '$path$file'"
        if [ ${file: -4} == ".sql" ]
        then
            echo "Executing sql file..."
            ${mysql[@]} < "$path$file"
            rm -fv "$path$file"
        else
            echo "The file does not seem to be an sql file... ignoring."
        fi
    done