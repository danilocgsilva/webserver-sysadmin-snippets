#!/bin/bash

source files/files.sh
source get_server_connection_data.sh

for i in "${FILES[@]}"
do
    scp files/$i $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
done


