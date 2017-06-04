#!/usr/bin/env bash

# --------------------------------------------------- #
# Bootstrap for EF/Squirrel stage-testing environment #
# --------------------------------------------------- #

# Get the apt-get cache up-to-date
sudo apt-get update

# Install G++ for node-gyp
sudo apt-get install -y g++

# Install GIT
sudo apt-get install -y git-all

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo sudo apt-get install -y mysql-server

# Install NodeJS LTS version 6.x
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs

# Install EF/Stage-Squirrel
sudo su - vagrant -c "cd ~ && git clone https://github.com/eurofurence/Stage-Squirrel.git"
sudo su - vagrant -c "cd ~/Stage-Squirrel && npm install"
