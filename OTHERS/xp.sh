#!/bin/bash

#----- Auto Remove Vless Websocket TLS & NTLS
data=( `cat /usr/local/etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/none.json
rm -f /usr/local/etc/xray/configlogs/vlessws-$user.txt
systemctl restart xray.service
systemctl restart xray@none.service
fi
done