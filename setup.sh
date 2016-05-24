#!/bin/bash -x

cd /root/micro-api

# get the pre installed nodemodules to here to save demo time
# comment this out to do native install
mv /root/micro-image/node_modules .
sudo apt-get remove python-pip
sudo easy_install -U pip
sudo pip install awscli
# install node modules. the above mv will make this zip through as nothing new is installed
#test
npm install
