#!/bin/bash

if [ $# -lt 1 ]; then
  exit 1
fi

SQ_DB_USER=root
SQ_DB_PW=root
SQ_DB_NAME=stagetest

SQ_USER_NAME=$1
echo 'Activating "'$SQ_USER_NAME'" and configuring him as admin ... '

SQ_USER_ID=$( \
  mysql -u$SQ_DB_USER -p$SQ_DB_PW $SQ_DB_NAME -sse \
    "SELECT user_id FROM sq_user WHERE user_name='$SQ_USER_NAME' LIMIT 1;" \
      2>/dev/null \
)
if [[ $SQ_USER_ID =~ ^[0-9]+$ ]]; then
  mysql -u$SQ_DB_USER -p$SQ_DB_PW $SQ_DB_NAME -sse \
    "UPDATE sq_user SET user_active='1' WHERE user_id='$SQ_USER_ID';" \
      2>/dev/null
  mysql -u$SQ_DB_USER -p$SQ_DB_PW $SQ_DB_NAME -sse \
    "INSERT IGNORE INTO sq_map_user_to_role(user_id, role_id) VALUES('$SQ_USER_ID', '1');" \
      2>/dev/null
  echo 'done.'
  exit 0
else
  echo 'failed.'
  exit 1
fi
