#!/bin/bash

source components/common.sh
COMPONENT=catalogue

NodeJS_Install
RoboShop_App_User_Add
Download_Component_From_GitHub
Extract_Component
Install_NodeJS_Dependencies



# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue
