#!/bin/bash

if [ "$DEVEL0PWD" != "" ] && [ ! -e /root/.rdp-entrypoint-executed ]; then
	echo "Setting devel0 passwd"
	echo "devel0:$DEVEL0PWD" | chpasswd
	touch /root/.rdp-entrypoint-executed
fi

killall xrdp
killall xrdp-sesman

rm -f /var/run/xrdp-sesman.pid /var/run/xrdp.pid

xrdp-sesman &
xrdp &
