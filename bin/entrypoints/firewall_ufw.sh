#!/bin/bash

MODULE_ADDRESS=../modules/firewall_ufw

source $MODULE_ADDRESS/get_user_options.sh

if [ ! "$HELP" = 1 ]; then
    source $MODULE_ADDRESS/execute.sh
else
    source $MODULE_ADDRESS/help.sh
fi
