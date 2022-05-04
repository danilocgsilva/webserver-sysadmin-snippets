#!/bin/bash

source server_files/files.sh
source get_user_options.sh

for i in "${FILES[@]}"; do
    scp server_files/$i $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
done

cat server_files/nginx-https.template | \
    sed s@=COUNTRY_NAME/@=$COUNTRY_NAME/@ | \
    sed s@=STATE_NAME/@=$STATE_NAME/@ | \
    sed s@=LOCAL_NAME/@=$LOCAL_NAME/@ | \
    sed s@=ORGANIZATION_NAME/@=$ORGANIZATION_NAME/@ | \
    sed s@=UNIT_NAME/@=$UNIT_NAME/@ | \
    sed s@=FULL_QUALIFIED_SERVER_NAME/@=$FULL_QUALIFIED_SERVER_NAME/@ | \
    sed "s/=EMAIL_ADDRESS\//=$EMAIL_ADDRESS\//" | \
    tee /tmp/nginx-https.sh > /dev/null
exit
