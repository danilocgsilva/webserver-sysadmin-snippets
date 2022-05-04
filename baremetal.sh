#!/bin/bash

source files/files.sh

read -p "Type the server user: " SERVER_USER
read -p "Type the server address: " SERVER_ADDRESS

for i in "${FILES[@]}"
do
    scp files/$i $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
done


