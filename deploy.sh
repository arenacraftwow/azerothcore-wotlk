#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide a SSH connection string";
  echo "For example username@deploy-target.com";
  echo "This requires you to use SSH keys!";
  exit -1;
fi;

rsync -rzvhP ~/dev/wow_server $1:~