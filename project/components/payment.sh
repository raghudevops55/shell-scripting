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

#Update the roboshop user and group id in payment.ini file.



# mv /home/roboshop/payment/systemd.service /etc/systemd/system/payment.service
# systemctl daemon-reload
# systemctl enable payment
# systemctl start payment