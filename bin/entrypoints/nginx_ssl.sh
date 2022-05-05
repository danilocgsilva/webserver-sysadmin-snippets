#!/bin/bash

MODULE_ADDRESS=../modules/nginx_ssl

source $MODULE_ADDRESS/server_files/statics/files_static.sh
source $MODULE_ADDRESS/get_user_options.sh

if [ ! "$HELP" = 1 ]; then
    source $MODULE_ADDRESS/execute.sh
else
    source $MODULE_ADDRESS/help.sh
fi

