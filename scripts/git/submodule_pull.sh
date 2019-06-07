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

git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    echo "ERROR: The program 'git' is currently not installed."
    echo "Try: 'sudo apt install git' to install it"
    exit 1
fi

git submodule init
if [ -f $PROJECT/docker/.ssh/id_rsa ]; then
    if [ `stat -c %a $PROJECT/docker/.ssh/id_rsa` -ne '600' ]; then
        chmod -R a=rwX,go-rwX $PROJECT/docker/.ssh
    fi
    ssh-agent sh -c "ssh-add -D; ssh-add $ROOT/docker/.ssh/id_rsa; git submodule update"
else
    git submodule update
fi
