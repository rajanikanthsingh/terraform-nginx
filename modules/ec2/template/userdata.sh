#!/bin/bash
set -x
apt update -y
apt install nginx net-tools -y
systemctl start nginx
systemctl enable nginx
echo "<p>SmoothiePower!</p>" >> /var/www/html/index.html
chown -R www-data:www-data /var/www/html/
