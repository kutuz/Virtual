apt-get install -y apt-transport-https ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ jessie main" > /etc/apt/sources.list.d/php.list
apt-get update
apt-get purge 'php.*'
apt-get install -y php5.6-cli php5.6-curl \
php5.6-fpm php5.6-gd php5.6-intl php5.6-json \
php5.6-mbstring php5.6-mcrypt php5.6-pdo-mysql \
php5.6-xml php5.6-zip