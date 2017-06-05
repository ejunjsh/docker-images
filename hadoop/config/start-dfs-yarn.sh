#!/bin/bash
if [ -n "$master"  ]
then
hadoop-daemon.sh start namenode
hadoop-daemon.sh start secondarynamenode
yarn-daemon.sh start resourcemanager
fi

if [ -n "$slave"  ]
then
hadoop-daemon.sh start datanode
yarn-daemon.sh start nodemanager
fi
