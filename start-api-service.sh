#!/bin/bash

# startApiService - this script starts and stops the startApiService daemon
#
# chkconfig: 35 99 01
# description:  startApiService is a daemon that starts the Production spring application when Server is restarted or it is starting

/usr/bin/java -jar /var/lib/jenkins/workspace/Production/target/*.jar >> production.log
