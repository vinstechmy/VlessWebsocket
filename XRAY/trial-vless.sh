#!/bin/bash
clear
domain=$(cat /usr/local/etc/xray/domain)
user=TRIAL-`echo $RANDOM | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`

sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/none.json

vlesslink1="vless://${uuid}@${domain}:443?type=ws&encryption=none&security=tls&host=${domain}&path=/vless-tls&allowInsecure=1&sni=${domain}#XRAY_VLESS_TLS_${user}"
vlesslink2="vless://${uuid}@${domain}:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless-ntls#XRAY_VLESS_NON_TLS_${user}"

systemctl restart xray.service
systemctl restart xray@none.service
service cron restart

clear
echo -e "" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "════════════[TRIAL XRAY VLESS WS]════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Remarks           : ${user}" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Domain            : ${domain}" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Port TLS          : 443" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Port None TLS     : 80" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "ID                : ${uuid}" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Security          : TLS" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Encryption        : None" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Network           : WS" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Path TLS          : /vless-tls" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Path NTLS         : /vless-ntls" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Custom Path       : /yourpath (Support For Non-TLS Only)" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "═════════════════════════════════════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Link WS TLS       : ${vlesslink1}" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "═════════════════════════════════════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Link WS None TLS  : ${vlesslink2}" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "═════════════════════════════════════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Created On        : $hariini" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Expired On        : $exp" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "═════════════════════════════════════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Autoscript By Vinstechmy" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
