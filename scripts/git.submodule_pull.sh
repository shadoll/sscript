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

chmod -R a=rwX,go-rwX "$ROOT"/docker/.ssh/

git submodule init
ssh-agent sh -c "ssh-add -D; ssh-add $ROOT/docker/.ssh/id_rsa; git submodule update"
