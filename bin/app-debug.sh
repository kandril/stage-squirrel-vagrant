#!/usr/bin/env bash
vagrant ssh -c \
    'sudo su -- vagrant -c "killall node; $(which node) debug /home/vagrant/Stage-Squirrel/server.js"'
