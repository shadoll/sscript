#!/bin/bash
#
# @package   sscripts
# @author    sHa <sha@shadoll.dev>
# @copyright 2019 shadoll
# @version   19.6.7
# @link      https://shadoll.dev
#

DIR=$(dirname $BASH_SOURCE)
PROJECT=(${DIR//node_modules/ })

if [ ! -f $PROJECT/docker-compose.yml ]; then
    echo "ERROR: '$PROJECT/docker-compose.yml' file not found"
    exit 1
fi

cd $PROJECT

docker-compose exec git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    echo "ERROR: The program 'git' is currently not installed."
    exit 1
fi
docker-compose exec app git "$@"
