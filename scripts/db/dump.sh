#!/bin/bash
#
# @package   sscripts
# @author    sHa <sha@shadoll.dev>
# @copyright 2019 shadoll
# @version   19.6.7
# @link      https://shadoll.dev
#

DIR=$(dirname "$0")
ROOT=$(cd "$DIR"/.. && pwd)

DATABASE=$(awk -F'=' '/^MYSQL_DATABASE/ { print $2}' $ROOT/docker/config.env)
PWD=$(awk -F'=' '/^MYSQL_ROOT_PASSWORD/ { print $2}' $ROOT/docker/config.env)

docker-compose exec db /usr/bin/mysqldump --skip-comments -uroot --password=$PWD $DATABASE > $ROOT/storage/database/dump/database.sql 2>/dev/null
