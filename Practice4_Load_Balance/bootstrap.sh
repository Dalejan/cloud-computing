#!/bin/bash

echo "*** [INSTALANDO] Apache"
apt update && apt upgrade 
apt install apache2 -y
systemctl enable apache2

echo "*** [MODIFICANDO] index.html"

cat <<TEST> /var/www/html/index.html
My server running from $(hostname)
TEST

echo "*** [ACTIVANDO] Apache"
systemctl start apache2
