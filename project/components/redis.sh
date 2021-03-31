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


#Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf
#
#Start Redis Database

# systemctl enable redis
# systemctl start redis