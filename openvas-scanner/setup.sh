#!/bin/bash

set -e
set -x

# Add the repository where I have rebuilt the
# packages from Kali. These packages will be
# tweaked to better suit our user case.
echo "deb http://ppa.launchpad.net/gijutsu/openvas/ubuntu trusty main" >> /etc/apt/sources.list
apt-key add /opt/openvas/ppakey.pub

apt-get update
apt-get -y install openvas-scanner \
                   openvas-manager \
                   openvas-cli \
                   sqlite3 \
                   xsltproc \
                   bzip2 \
                   psmisc \
                   curl \
                   wget

apt-get clean
rm -rf /var/lib/apt/lists/*

#sed -i 's/GSA_ADDRESS=127.0.0.1/GSA_ADDRESS=0.0.0.0/' /etc/default/greenbone-security-assistant

/opt/openvas/openvas-scanner-setup

# Remove the keys so that no one put these systems online 
# with default keys still available - ready to be exploited.
rm /var/lib/openvas/CA/*
rm /var/lib/openvas/private/CA/*
