#!/bin/bash


LID=lt-02efe84819439dc81
LVER=2
COMPONENT=$1

if [ -z "${COMPOENT}" ]; then
  echo "Component Name INput is needed"
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}]" | jq



