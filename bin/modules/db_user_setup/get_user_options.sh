while getopts "iu:h:" option; do
    case $option in
        i) # help (i to not conflit with host)
            HELP=1
            ;;
        u) # set a user to send files to the server
            SERVER_USER=$OPTARG
            ;;
        h) # set a host server to send the files
            SERVER_ADDRESS=$OPTARG
            ;;
        g) # Local files, not send to server
            TO_LOCAL=$OPTARG
            ;;
done