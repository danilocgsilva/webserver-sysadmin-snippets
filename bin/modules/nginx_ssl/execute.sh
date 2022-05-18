source $MODULE_ADDRESS/send_template_files.sh

for i in "${FILES_STATIC[@]}"; do
    if [ -z $TO_LOCAL ]; then
        scp $MODULE_ADDRESS/server_files/statics/$i $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
    else
        cp $MODULE_ADDRESS/server_files/statics/$i $TO_LOCAL/
    fi
done

source $MODULE_ADDRESS/post_entry.sh
