#!/bin/bash

AMI=ami-0b4f379183e5706b9 
SG_ID=sg-085cac89efaca39c7 #replace with your id
INSTANCES=( "mongodb" "redis" "mysql" "rabbitmq""catalogue" "user" "payment" "dispatch" "web" "cart" "shipping")

for i in "${INSTANCES[@]}"
do
       echo " instance is : $i"
      if  [ $i == "mongodb"] || [ $i == "mysql"] || [ $i == "shipping"] ||
      then
           INSTANCES_TYPE="t3.small"
       else
           INSTANCES_TYPE="t2.micro"
       fi

        aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type $INSTANCE_TYPE --security-group-ids sg-085cac89efaca39c7
 done 
