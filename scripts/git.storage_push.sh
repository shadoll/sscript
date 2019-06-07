#!/bin/bash
#
# @package   sscripts
# @author    sHa <sha@shadoll.dev>
# @copyright 2019 shadoll
# @version   19.6.7
# @link      https://shadoll.dev
#

DIR=$(dirname $BASH_SOURCE)
PROJECT=$(cd $DIR"/.."; pwd)
cd $PROJECT/storage

git add . --all &&
git commit -m "storage"
git push origin master --force
