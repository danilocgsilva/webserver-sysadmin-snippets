#!/bin/bash

if [ -w /etc/ssl/private ]
then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
    source create_selfsigned.sh
else
    echo I cannot write. May not proceed.
fi

source clean.sh

