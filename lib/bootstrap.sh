#!/usr/bin/env bash

# --------------------------------------------------- #
# Bootstrap for EF/Squirrel stage-testing environment #
# --------------------------------------------------- #

# Get the apt-get cache up-to-date
apt-get update

# Install G++ for node-gyp
apt-get install -y g++

# Install GIT
apt-get install -y git-all

# Un-Install Apache
service apache2 stop
apt-get -y remove apache2

# Install NGINX
apt-get -y install nginx
service nginx start

# Set up NGINX server
echo \
'server {
  listen 80 default_server;
  listen [::]:80 default_server;
  server_name _;
  location / {
    proxy_pass http://127.0.0.1:'"$SQ_APP_LISTEN_PORT"';
  }
}
' > /etc/nginx/sites-available/default
chmod 644 /etc/nginx/sites-available/default
ln -sf \
  /etc/nginx/sites-available/default \
  /etc/nginx/sites-enabled/default
service nginx restart


# Install MySQL Server in a Non-Interactive mode.
#   Default root password will be "root"
echo "mysql-server mysql-server/root_password password $SQ_DB_PW" | \
  debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $SQ_DB_PW" | \
  debconf-set-selections
apt-get install -y mysql-server

# Reset DB
echo 'Resetting database ...'
mysql -u$SQ_DB_USER -p$SQ_DB_PW -e '
  DROP DATABASE IF EXISTS `'$SQ_DB_NAME'`;
  CREATE DATABASE `'$SQ_DB_NAME'`;
'
echo 'done.'

# Install NodeJS LTS version 6.x
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get update
apt-get install -y nodejs
