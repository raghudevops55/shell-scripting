#!/bin/bash


LID=lt-02efe84819439dc81
LVER=2
aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} | jq



