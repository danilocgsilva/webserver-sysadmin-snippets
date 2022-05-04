while getopts "iu:h:c:s:l:o:v:f:e:" option; do
    case $option in
        i) # help (i to not conflit with host)
            source '../modules/nginx_ssl/help.sh'
            exit
            ;;
        u) # set a user to send files to the server
            SERVER_USER=$OPTARG
            ;;
        h) # set the host address
            SERVER_ADDRESS=$OPTARG
            ;;
        c) # country name
            COUNTRY_NAME=$OPTARG
            ;;
        s) # state name
            STATE_NAME=$OPTARG
            ;;
        l) # local name
            LOCAL_NAME=$OPTARG
            ;;
        o) # organization name
            ORGANIZATION_NAME=$OPTARG
            ;;
        v) # unit name (v to not conflict with user)
            UNIT_NAME=$OPTARG
            ;;
        f) # Full Qualified Server Name
            FULL_QUALIFIED_SERVER_NAME=$OPTARG
            ;;
        e) # Email address
            EMAIL_ADDRESS=$OPTARG
            ;;
    esac
done

if [ -z $SERVER_USER ]; then
    read -p "Type the server user: " SERVER_USER
fi

if [ -z $SERVER_ADDRESS ]; then
    read -p "Type the server address: " SERVER_ADDRESS
fi

if [ -z $COUNTRY_NAME ]; then
  read -p "Country Name (2 letter code): " COUNTRY_NAME
fi

if [ -z $STATE_NAME ]; then
  read -p "State Name (2 letter code): " STATE_NAME
fi

if [ -z $LOCAL_NAME ]; then
  read -p "Locality Name (eg, city): " LOCAL_NAME
fi

if [ -z $ORGANIZATION_NAME ]; then
  read -p "Organization Name (eg, city): " ORGANIZATION_NAME
fi

if [ -z $UNIT_NAME ]; then
  read -p "Organizational Unit Name (eg, section): " UNIT_NAME
fi

if [ -z $FULL_QUALIFIED_SERVER_NAME ]; then
  read -p "Common Name (e.g. server FQDN or YOUR name): " FULL_QUALIFIED_SERVER_NAME
fi

if [ -z $EMAIL_ADDRESS ]; then
  read -p "Email Address: " EMAIL_ADDRESS
fi
