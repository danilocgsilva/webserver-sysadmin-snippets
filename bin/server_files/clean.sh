#!/bin/bash

if ls .. | grep -iE "^baremetal.sh$" > /dev/null 2>&1
then
    echo I am in repository folder. I am $0.
else
    source files.sh
    for i in "${FILES[@]}"
    do
        rm $i
    done
fi