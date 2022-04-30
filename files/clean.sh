#!/bin/bash

if ls .. | grep -iE "^baremetal.sh$" > /dev/null 2>&1
then
    echo I am in repository folder. I am $0.
else
    echo I am not in the repository folder. I can be removed.
fi