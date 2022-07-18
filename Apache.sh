apt-get install -y apache2
rm /etc/apache2/ports.conf
cat > /etc/apache2/ports.conf <<EOF
NameVirtualHost *:8888
Listen 8888
EOF

service apache2 restart