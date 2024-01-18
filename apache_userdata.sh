#!/bin/bash
#apache installation 
#user data will be executed by root user by default 
#ec2 --root/ec2-user
yum update -y 
yum install httpd -y 
systemctl start httpd 
systemctl enable httpd 
