#!/bin/bash
#
# @package   sscripts
# @author    sHa <sha@shadoll.dev>
# @copyright 2019 shadoll
# @version   19.6.7
# @link      https://shadoll.dev
#

DIR=`dirname "$(readlink -f "$0")"`
DIR=${DIR%/*}
if [ "${DIR##*/}" = ".git" ]; then
    DIR=${DIR%/*}
fi

test -z "$STREAM" && test -f $DIR/.env && STREAM=$(grep -e '^STREAM_NAME=.*' $DIR/.env | cut -d '=' -f2)
test -z "$STREAM" && STREAM="announce"

test -z "$HASH" && test -f $DIR/.env && HASH=$(grep -e '^ZULIP_HASH=.*' $DIR/.env | cut -d '=' -f2)
test -z "$HASH" && HASH="VUsqHUhn5AKndXSUKddYpTsNJm7kPKNY"

test -z "$URL" && test -f $DIR/.env && URL=$(grep -e '^ZULIP_HOST=.*' $DIR/.env | cut -d '=' -f2)
test -z "$URL" && URL="VUsqHUhn5AKndXSUKddYpTsNJm7kPKNY"

HOST=`hostname`
REPO=$(basename -s .git `git config --get remote.origin.url`)
BRANCH=`git branch | grep \* | cut -d ' ' -f2`

curl https://$URL/api/v1/messages \
    -u githook-bot@$URL:$HASH \
    -d "type=stream" \
    -d "to=$STREAM" \
    -d "subject=$REPO / $BRANCH" \
    -d "content=merged on $HOST"
