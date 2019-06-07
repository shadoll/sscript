#!/bin/bash
#
# @package   sscripts
# @author    sHa <sha@shadoll.dev>
# @copyright 2019 shadoll
# @version   19.6.7
# @link      https://shadoll.dev
#

# appname=$(awk -F'=' '/^APPNAME/ { print $2}' ./docker/.env)

docker-compose exec app npm "$@"
