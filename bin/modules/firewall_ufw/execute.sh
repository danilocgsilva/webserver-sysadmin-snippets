echo "ufw enable" >> /tmp/set_firewall.sh
echo "" >> /tmp/set_firewall.sh
chmod +x /tmp/set_firewall.sh

oldIFS="$IFS"
IFS=',' read -r -a A_PORTS <<< "$PORTS"
IFS="$oldIFS"

for i in "${A_PORTS[@]}"
do
   echo "ufw allow $i" >> /tmp/set_firewall.sh
done

if [ -z $TO_LOCAL ]; then
    scp /tmp/set_firewall.sh $SERVER_USER@$SERVER_ADDRESS://home/$SERVER_USER
else
    cp /tmp/set_firewall.sh $TO_LOCAL/
fi

rm /tmp/set_firewall.sh

source $MODULE_ADDRESS/post_entry.sh
