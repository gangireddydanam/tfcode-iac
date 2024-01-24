#!/bin/bash
#function -control goes here -2
install_nginx() 
{
yum update -y 
yum install nginx -y 
systemctl start nginx
systemctl enable nginx
}
#calling function-1st control comes here -1
install_nginx 
