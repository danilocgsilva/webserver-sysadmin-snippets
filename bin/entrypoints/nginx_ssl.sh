#!/bin/bash

MODULE_ADDRESS=../modules/nginx_ssl

source $MODULE_ADDRESS/server_files/statics/files_static.sh
source $MODULE_ADDRESS/get_user_options.sh

for i in "${FILES_STATIC[@]}"; do
    scp $MODULE_ADDRESS/server_files/statics/$i $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
done

cat $MODULE_ADDRESS/server_files/templates/nginx-https.template | \
    sed s@=COUNTRY_NAME/@=$COUNTRY_NAME/@ | \
    sed s@=STATE_NAME/@=$STATE_NAME/@ | \
    sed s@=LOCAL_NAME/@=$LOCAL_NAME/@ | \
    sed s@=ORGANIZATION_NAME/@=$ORGANIZATION_NAME/@ | \
    sed s@=UNIT_NAME/@=$UNIT_NAME/@ | \
    sed s@=FULL_QUALIFIED_SERVER_NAME/@=$FULL_QUALIFIED_SERVER_NAME/@ | \
    sed "s/=EMAIL_ADDRESS\//=$EMAIL_ADDRESS\//" | \
    tee /tmp/nginx-https.sh > /dev/null

chmod +x /tmp/nginx-https.sh

cat $MODULE_ADDRESS/server_files/templates/create_server_block.template | \
    sed "s/FULL_QUALIFIED_SERVER_NAME/$FULL_QUALIFIED_SERVER_NAME/g" | \
    tee /tmp/create_server_block.sh > /dev/null

scp /tmp/nginx-https.sh $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
rm /tmp/nginx-https.sh

scp /tmp/create_server_block.sh $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
rm /tmp/create_server_block.sh
