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

ROOT=$(cd "$PROJECT"/.. && pwd)

sudo chown -R :www-data $ROOT
sudo chmod -R g+rwX $ROOT

if [ -d $ROOT/docker/.ssh/]; then
    sudo chmod -R a=rwX,go-rwX "$ROOT"/docker/.ssh/
fi
