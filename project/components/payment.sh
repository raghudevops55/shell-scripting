#!/bin/bash

source components/common.sh
COMPONENT=payment

OS_Prereqs

PRINT "Install Python 3"
yum install python36 gcc python3-devel -y
STAT $? "Installing Python"

RoboShop_App_User_Add
Download_Component_From_GitHub
Extract_Component


PRINT "Install Python App dependencies"
cd /home/roboshop/payment
pip3 install -r requirements.txt
STAT $? "Installing Dependencies"

USER_ID=$(id -u roboshop)
GROUP_ID=$(id -g roboshop)

PRINT "Update Payment Configuration"
sed -i -e "/^uid/ c uid = ${USER_ID}" -e "/^gid/ c gid = ${GROUP_ID}"  /home/roboshop/payment/payment.ini
STAT $? "Updating Payment Configuration"

Setup_Service