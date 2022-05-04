#!/bin/bash

if ls .. | grep -iE "^baremetal.sh$" > /dev/null 2>&1
then
    echo I am in repository folder. I am $0.
else
    source files_static.sh
    for i in "${FILES_STATIC[@]}"
    do
        rm $i
    done

    rm nginx-https.sh
    rm create_server_block.sh
fi