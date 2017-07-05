#!/bin/bash

if [ $# -gt 0 ]; then
  vagrant ssh -c 'sudo su -- vagrant -c "~/.helper/activate-set-admin.sh '$1'"'
else
  exit 1
fi
