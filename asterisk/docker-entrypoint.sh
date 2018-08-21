#!/bin/bash
set -e
if [ "$1" = 'asterisk' ]; then

    exec asterisk -cvvvvvvvvvv
    //exec /usr/sbin/asterisk -f -U asterisk -G asterisk -vvvg -c
fi
exec "$@"
