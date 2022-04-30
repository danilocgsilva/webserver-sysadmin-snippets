#!/bin/bash

if [ -w /etc/ssl/private ]
then
    echo I can write.
else
    echo I cannot write. May not proceed.
fi

source clean.sh

