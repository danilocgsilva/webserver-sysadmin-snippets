while getopts "u:h:" option; do
    case $option in
        u) # set a user to send files to the server
            SERVER_USER=$OPTARG
            ;;
        h) # set the host address
            SERVER_ADDRESS=$OPTARG
            ;;
    esac
done

if [ -z $SERVER_USER ]; then
    read -p "Type the server user: " SERVER_USER
fi

if [ -z $SERVER_ADDRESS ]; then
    read -p "Type the server address: " SERVER_ADDRESS
fi