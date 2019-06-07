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

if [ ! -d $PROJECT/storage ]; then
    echo "ERROR: '$PROJECT/storage' dir not found"
    exit 1
fi

git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ ! $GIT_IS_AVAILABLE -eq 0 ]; then
    echo "ERROR: The program 'git' is currently not installed."
    echo "Try: 'sudo apt install git' to install it"
    exit 1
fi


cd $PROJECT/storage

git add . --all &&
git commit -m "storage"
git push origin master --force
