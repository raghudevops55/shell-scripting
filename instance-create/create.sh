#!/bin/bash


LID=lt-02efe84819439dc81
LVER=3
COMPONENT=$1

if [ -z "${COMPONENT}" ]; then
  echo "Component Name INput is needed"
  exit 1
fi

INSTANCE_EXISTS=$(aws ec2 describe-instances  --filters Name=tag:Name,Values=${COMPONENT}  | jq .Reservations[])
if [ -z "INSTANCE_EXISTS" ]; then
  aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
fi



