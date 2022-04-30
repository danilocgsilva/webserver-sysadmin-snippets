#!/bin/bash

read -p "Type the server user: " SERVER_USER
read -p "Type the server address: " SERVER_ADDRESS

scp files/nginx-https.sh $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
scp files/clean.sh $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
