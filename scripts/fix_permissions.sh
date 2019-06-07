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

sudo chmod -R a=rwX,go-rwX "$ROOT"/docker/.ssh/

sudo chown -R :www-data $ROOT
sudo chmod -R g+rwX $ROOT
