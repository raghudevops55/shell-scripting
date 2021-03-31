#!/bin/bash

source components/common.sh
COMPONENT=redis

OS_Prereqs

PRINT "Setup Redis Repos"
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
STAT $? "Setting Up Redis repos"

PRINT "Install Redis"
yum install redis -y
STAT $? "Install Redis"

PRINT "Update Redis Configuration File"
sed -i -e '/^bind/ c bind 0.0.0.0' /etc/redis.conf
STAT $? "Updating COnfiguration File of Redis"

PRINT "Start Redis Service"
systemctl enable redis
systemctl restart redis
STAT $? "Starting Redis Service"
