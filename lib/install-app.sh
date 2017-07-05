#!/usr/bin/env bash

# Install EF/Stage-Squirrel
cd ~
git clone \
  https://github.com/eurofurence/Stage-Squirrel.git \
  Stage-Squirrel
cd ~/Stage-Squirrel
npm install

# Initialize EF/Stage-Squirrel database
echo 'Initializing database (tables & data) ...'
mysql -u$SQ_DB_USER -p$SQ_DB_PW $SQ_DB_NAME < sql/initial_load.sql
echo 'done.'

# Configure EF/Stage-Squirrel
git checkout develop

## Prepare config/startup.conf
echo 'Configuring config/startup.conf ...'
SQ_LOGDIR=$PWD/log
NODE_HOME=$(which node | sed 's!/node!!g')
sed -n -e \
  's!^program_home=.*!program_home='"$PWD"'!g' \
  config/startup.conf
sed -n -e \
  's!^nodejs_bin_dir=.*!nodejs_bin_dir='"$NODE_HOME"'!g' \
  config/startup.conf
sed -n -e 's!^user=.*!user=vagrant!g' config/startup.conf
sed -n -e \
  's!^logdir=.*!logdir='"$SQ_LOGDIR"'/console.log!g' \
  config/startup.conf
echo 'done.'

## Prepare config/config.js
echo 'Configuring config/config.js ...'
node -e "
var e=process.env;
var c=require('./config/config.js');
if(c){
  c.listenport=e.SQ_APP_LISTEN_PORT;
  c.baseurl='localhost:'+e.SQ_APP_LISTEN_PORT;
  c.telegramfeedbackid=e.SQ_TELEGRAM_FEEDBACK_ID;
  c.database=c.database||{};
  c.database.host=e.SQ_DB_HOST;
  c.database.user=e.SQ_DB_USER;
  c.database.password=e.SQ_DB_PW;
  c.database.database=e.SQ_DB_NAME;
}
require('fs').writeFileSync(
  './config/config.js',
  'module.exports = '+JSON.stringify(c,null,4)
);
"
echo 'done.'

# Ensure, that the startup-script is executable and execute it
chmod a+x $PWD/stagesquirrel
mkdir -p $SQ_LOGDIR
$PWD/stagesquirrel restart

# Ensure, that we are always in the Stage-Squirrel dir on SSH login
echo "cd ~/Stage-Squirrel" > ~/.bashrc
