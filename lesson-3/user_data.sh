#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<center><h2>Hello from Terraform! My ip: $myip</h2></center>" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
