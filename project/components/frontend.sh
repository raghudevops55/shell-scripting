#!/bin/bash

PRINT "Installing Nginx"
yum install nginx -y
STAT $? "Nginx Installation"


exit

echo "------------------------------------------------------------------------------------------------------------"
echo -e "\e[1;35m [INFO] Download Frontend Component\e[0m"
echo "------------------------------------------------------------------------------------------------------------"

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
if [ $? -ne 0 ]; then
  echo "------------------------------------------------------------------------------------------------------------"
  echo -e "\e[1;31m [ERROR] Download failure\e[0m"
  exit 2
else
  echo "------------------------------------------------------------------------------------------------------------"
  echo -e "\e[1;32m [SUCC] Download is successful\e[0m"
fi

echo "------------------------------------------------------------------------------------------------------------"

exit

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

systemctl enable nginx
systemctl restart nginx
