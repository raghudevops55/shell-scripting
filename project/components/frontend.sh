#!/bin/bash

echo -e "\e[1;35m [INFO] Installing Nginx\e[0m"
yum install nginx -y
STAT=$?
if [ $STAT -ne 0 ]; then
  echo -e "\e[1;31m [ERROR] Nginx Installation is failure\e[0m"
  echo "EXIT STATUS = $STAT"
  exit 2
else
  echo -e "\e[1;32m [SUCC] Nginx Installation is successful"
fi

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
