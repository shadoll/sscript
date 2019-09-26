#!/bin/bash
#
# @package   sscripts
# @author    sHa <sha@shadoll.dev>
# @copyright 2019 shadoll
# @version   19.9.26
# @link      https://shadoll.dev
#

DIR=$(dirname $BASH_SOURCE)
PROJECT=(${DIR//node_modules/ })

if [ ! -f $PROJECT/docker-compose.yml ]; then
    echo "ERROR: '$PROJECT/docker-compose.yml' file not found"
    exit 1
fi

cd $PROJECT

DATABASE=$(awk -F'=' '/^DB_DATABASE/ { print $2}' $PROJECT/.env)
PWD=$(awk -F'=' '/^DB_ROOT_PASSWORD/ { print $2}' $PROJECT/.env)
HOST=$(awk -F'=' '/^DB_HOST/ { print $2}' $PROJECT/.env)

docker-compose exec $HOST /usr/bin/mysql -uroot --password=$PWD $DATABASE < $PROJECT/storage/database/dump/database.sql
