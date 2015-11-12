#!/bin/bash

set -e
set -x

if [[ -e /var/lib/openvas/CA/cacert.pem ]]; then

    test -e /var/lib/openvas/CA/clientcert.pem && \
    openssl verify -CAfile /var/lib/openvas/CA/cacert.pem \
    /var/lib/openvas/CA/clientcert.pem

    if [[ $? -ne 0  ]]; then
        echo "Error: You have not created a valid client certificate."
        exit 1
    else
        echo "Valid client certificate found."
    fi

else

    echo "Error: You have not created a CA."
    exit 1

fi

service redis-server start
service openvas-scanner start
service openvas-manager start
service greenbone-security-assistant start

read -p "Press enter to exit"
