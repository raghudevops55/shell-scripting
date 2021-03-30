#!/bin/bash

source components/common.sh
COMPONENT=cart

PRINT "Install NodeJS"
yum install nodejs make gcc-c++ -y
STAT $? "Installing NodeJS"

PRINT "Create RoboShop Application User"
useradd roboshop
STAT $? "Creating Application User"

PRINT "Download Cart Component"
curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
STAT $? "Downloading Cart"

PRINT "Extract Cart"
cd /home/roboshop
rm -rf cart && unzip /tmp/cart.zip && mv cart-main cart
STAT $? "Extracting Catalogue"

PRINT "Download NodeJS dependencies"
cd /home/roboshop/cart
npm install
STAT $? "Downloading dependencies"
