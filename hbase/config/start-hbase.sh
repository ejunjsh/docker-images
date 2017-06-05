#!/bin/bash
if [ -n "$master"  ]
then
sleep 5
hbase-daemon.sh start master
fi

if [ -n "$slave"  ]
then
sleep 5
hbase-daemon.sh start regionserver
fi
