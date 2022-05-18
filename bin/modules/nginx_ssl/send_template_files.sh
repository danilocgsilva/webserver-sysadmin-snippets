SUBJECT=$(
    echo "/C=COUNTRY_NAME/ST=STATE_NAME/L=LOCAL_NAME/O=ORGANIZATION_NAME/OU=UNIT_NAME/CN=FULL_QUALIFIED_SERVER_NAME/emailAddress=EMAIL_ADDRESS/" | \
    sed s@=COUNTRY_NAME/@=$COUNTRY_NAME/@ | \
    sed s@=STATE_NAME/@=$STATE_NAME/@ | \
    sed s@=LOCAL_NAME/@=$LOCAL_NAME/@ | \
    sed s@=ORGANIZATION_NAME/@=$ORGANIZATION_NAME/@ | \
    sed s@=UNIT_NAME/@=$UNIT_NAME/@ | \
    sed s@=FULL_QUALIFIED_SERVER_NAME/@=$FULL_QUALIFIED_SERVER_NAME/@ | \
    sed "s/=EMAIL_ADDRESS\//=$EMAIL_ADDRESS\//" | \
    sed "s@/@\\\/@g"
)

cat $MODULE_ADDRESS/server_files/templates/nginx-https.template | \
    sed s/\{SUBJECT\}/$SUBJECT/ | \
    sed s/FULL_QUALIFIED_SERVER_NAME/$FULL_QUALIFIED_SERVER_NAME/ | \
    tee /tmp/nginx-https.sh > /dev/null

chmod +x /tmp/nginx-https.sh

cat $MODULE_ADDRESS/server_files/templates/create_server_block.template | \
    sed "s/FULL_QUALIFIED_SERVER_NAME/$FULL_QUALIFIED_SERVER_NAME/g" | \
    tee /tmp/create_server_block.sh > /dev/null

if [ -z $TO_LOCAL ]; then
    scp /tmp/nginx-https.sh $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
    scp /tmp/create_server_block.sh $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
else
    cp /tmp/nginx-https.sh $TO_LOCAL/
    cp /tmp/create_server_block.sh $TO_LOCAL/
fi

rm /tmp/nginx-https.sh
rm /tmp/create_server_block.sh

