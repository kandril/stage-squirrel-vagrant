#!/bin/bash

HELPER_SET_ADMIN=~/.helper/activate-set-admin.sh
HELPER_UNSET_ADMIN=~/.helper/activate-unset-admin.sh

echo 'Configuring helper scripts ...'
sed -n -e 's/ #DB_USER#/'"$SQ_DB_USER"'/g' $HELPER_SET_ADMIN
sed -n -e 's/ #DB_PW#/'"$SQ_DB_PW"'/g' $HELPER_SET_ADMIN
sed -n -e 's/ #DB_NAME#/'"$SQ_DB_NAME"'/g' $HELPER_SET_ADMIN

sed -n -e 's/ #DB_USER#/'"$SQ_DB_USER"'/g' $HELPER_UNSET_ADMIN
sed -n -e 's/ #DB_PW#/'"$SQ_DB_PW"'/g' $HELPER_UNSET_ADMIN
sed -n -e 's/ #DB_NAME#/'"$SQ_DB_NAME"'/g' $HELPER_UNSET_ADMIN
echo 'done.'

echo 'Making helper scripts executable ...'
chmod a+x $HELPER_SET_ADMIN
chmod a+x $HELPER_UNSET_ADMIN
echo 'done.'
