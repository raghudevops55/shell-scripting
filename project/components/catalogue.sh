#!/bin/bash

source components/common.sh
COMPONENT=catalogue

NodeJS_Install
RoboShop_App_User_Add


PRINT "Extract Catalogue"
cd /home/roboshop
rm -rf catalogue && unzip /tmp/catalogue.zip && mv catalogue-main catalogue
STAT $? "Extracting Catalogue"

PRINT "Download NodeJS dependencies"
cd /home/roboshop/catalogue
npm install
STAT $? "Downloading dependencies"

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue
