#!/bin/bash

getProcess=$(pgrep -f Production)

case "$1" in
start)
	if [ ! -z "$getProcess" ];
	then
		kill $getProcess
	fi

	/usr/bin/java -jar /var/lib/jenkins/workspace/Production/target/*.jar >> production.log & sleep 42 && getProcess1=$(pgrep -f Production)

	if [ -z "$getProcess1" ];
	then
		echo "/!\\ Tomcat fails while starting!";
		exit 1
	else
		exit 0
	fi
	;;
stop)
	if [ -z "$getProcess" ];
	then
		echo "Tomcat server is not running!";
	else
		kill $getProcess
	fi
	;;
restart)
	$0 stop
	$0 start
	;;
status)
	if [ -z "$getProcess" ];
	then
		echo "Tomcat server is not running!";
	else
		echo "Tomcat server is running, pid=$getProcess";
		exit 1
	fi
	;;
*)
	echo "Usage: $0 {start|stop|status|restart}"
esac
