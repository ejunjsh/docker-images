#!/bin/bash
if [ -n "$master"  ]
then
hbase-daemon.sh start master
fi

if [ -n "$slave"  ]
then
hbase-daemon.sh start regionserver
fi
