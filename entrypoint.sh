#!/bin/bash

rm -f /var/run/xrdp-sesman.pid /var/run/xrdp.pid

xrdp-sesman &
xrdp &
