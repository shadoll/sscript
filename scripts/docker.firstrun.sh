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

$ROOT/bin/app.composer install
$ROOT/bin/app.composer run-script post-root-package-install
$ROOT/bin/app.composer dump-autoload --optimize

$ROOT/bin/fix_permissions

$ROOT/bin/db.restore
