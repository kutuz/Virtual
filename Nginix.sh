apt-get install -y nginx
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
cat > /etc/nginx/sites-available/ScriptOS <<EOF
server {
listen 80;
server_name .ScriptOS.loc;
root "/home/vagrant/script";
index index.html index.htm index.php;
charset utf-8;
location / {
try_files \$uri \$uri/ /index.php?\$query_string;
}
location = /favicon.ico { access_log off; log_not_found off; }
location = /robots.txt { access_log off; log_not_found off; }
access_log off;
error_log /var/log/nginx/vagrantvm-error.log error;
location ~ \.php$ {
fastcgi_split_path_info ^(.+\.php)(/.+)$;
Vagrant 12
fastcgi_pass unix:/var/run/php/php5.6-fpm.sock;
fastcgi_index index.php;
include fastcgi_params;
fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
}
}
EOF
ln -s /etc/nginx/sites-available/ScriptOS /etc/nginx/sites-enabled/ScriptOS
service nginx restart