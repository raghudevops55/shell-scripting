#!/bin/bash


LID=lt-02efe84819439dc81
LVER=3
COMPONENT=$1

if [ -z "${COMPONENT}" ]; then
  echo "Component Name INput is needed"
  exit 1
fi

INSTANCE_EXISTS=$(aws ec2 describe-instances --filters Name=tag:Name,Values=${COMPONENT}  | jq .Reservations[])
STATE=$(aws ec2 describe-instances     --filters Name=tag:Name,Values=cart  | jq .Reservations[].Instances[].State.Name | xargs)
if [ -z "INSTANCE_EXISTS" -o "$STATE" == "terminated"  ]; then
  aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
else
  echo "Instance ${COMPONENT} already exists"
fi


IPADDRESS=$(aws ec2 describe-instances     --filters Name=tag:Name,Values=cart   | jq .Reservations[].Instances[].PrivateIpAddress | grep -v null |xargs)

sed -e "s/COMPONENT/${COMPONENT}/" -e "s/IPADDRESS/${IPADDRESS}/" record.json >/tmp/record.json
aws route53 change-resource-record-sets --hosted-zone-id Z0449177GO3AQK4VZZ1H --change-batch file:///tmp/record.json
