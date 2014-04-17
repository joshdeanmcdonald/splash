#!/bin/sh
kill -9 $(ps aux | grep splash | grep -v grep | grep -v splash.log | cut -c 10-14)
kill -9 $(ps aux | grep Xvfb | grep -v grep | cut -c 10-14)
sleep 5
rm -f splash.log
ulimit -c unlimited
./run.sh
