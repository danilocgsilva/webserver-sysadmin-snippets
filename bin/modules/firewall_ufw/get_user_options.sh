while getopts "iu:h:p:g:" option; do
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
        p) # ports to allow, coma separated
            PORTS=$OPTARG
            ;;
        g) # Local files, not send to server
            TO_LOCAL=$OPTARG
            ;;
    esac
done

if [ ! "$HELP" = 1 ]; then

  if [ -z $TO_LOCAL ]; then

    if [ -z $SERVER_USER ]; then
        read -p "Type the server user: " SERVER_USER
    fi

    if [ -z $SERVER_ADDRESS ]; then
        read -p "Type the server address: " SERVER_ADDRESS
    fi

  fi

fi