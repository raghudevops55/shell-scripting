#!/bin/bash

echo "------------------------------------------------------------------------------------------------------------"
echo -e "\e[1;35m [INFO] Installing Nginx\e[0m"
echo "------------------------------------------------------------------------------------------------------------"
yum install nginx -y
if [ $? -ne 0 ]; then
  echo -e "\e[1;31m [ERROR] Nginx Installation is failure\e[0m"
  exit 2
else
  echo -e "\e[1;32m [SUCC] Nginx Installation is successful"
fi
echo "------------------------------------------------------------------------------------------------------------"
echo "------------------------------------------------------------------------------------------------------------"

exit
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

systemctl enable nginx
systemctl restart nginx
