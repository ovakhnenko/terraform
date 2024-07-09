#!/bin/bash
yum -y update
yum -y install httpd

myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html><center><h2>
Hello from Terraform!
${f_name} ${l_name} $myip

%{ for x in list ~}
${x}<br>
%{ endfor ~}
  
</h2></center></html>
EOF

sudo service httpd start
chkconfig httpd on
