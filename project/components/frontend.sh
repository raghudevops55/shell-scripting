#!/bin/bash

USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ]; then
  echo "You should be a root user to perform this command"
fi

yum install nginx -y
