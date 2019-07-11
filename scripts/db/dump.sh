#!/bin/bash
#
# @package   sscripts
# @author    sHa <sha@shadoll.dev>
# @copyright 2019 shadoll
# @version   19.7.11
# @link      https://shadoll.dev
#

DIR=$(dirname $BASH_SOURCE)
PROJECT=(${DIR//node_modules/ })

if [ ! -f $PROJECT/docker-compose.yml ]; then
    echo "ERROR: '$PROJECT/docker-compose.yml' file not found"
    exit 1
fi

cd $PROJECT

DATABASE=$(awk -F'=' '/^MYSQL_DATABASE/ { print $2}' $PROJECT/docker/config.env)
PWD=$(awk -F'=' '/^MYSQL_ROOT_PASSWORD/ { print $2}' $PROJECT/docker/config.env)

docker-compose exec db /usr/bin/mysqldump --skip-comments -uroot --password=$PWD $DATABASE > $PROJECT/storage/database/dump/database.sql 2>/dev/null
