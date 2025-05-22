#!/bin/bash
clear
domain=$(cat /usr/local/etc/xray/domain)
MYIP2=$(wget -qO- ipv4.icanhazip.com);

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\E[0;41;36m     Add XRAY Vless WS Account     \E[0m"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
		    echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
            echo -e "\E[0;41;36m      Add XRAY Vless Account       \E[0m"
            echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			read -n 1 -s -r -p "Press any key to back on menu"
			menu
		fi
	done

read -p "Bug Address (Example: www.google.com) : " address
read -p "Bug SNI/Host (Example : m.facebook.com) : " hst
read -p "Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=${address}
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
bug=${hst}
bug2=bug.com
if [[ $hst == "" ]]; then
sni=$bug2
else
sni=$bug
fi

uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`

sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/none.json

# Restart Service
systemctl restart xray.service
systemctl restart xray@none.service
service cron restart

vlesslink1="vless://${uuid}@${sts}${domain}:443?type=ws&encryption=none&security=tls&host=${domain}&path=/vless-tls&allowInsecure=1&sni=${sni}#XRAY_VLESS_TLS_${user}"
vlesslink2="vless://${uuid}@${sts}${domain}:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless-ntls#XRAY_VLESS_NON_TLS_${user}"


clear
echo -e "" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "════════════[XRAY VLESS WS]════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
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
echo -e "═══════════════════════════════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Link WS TLS       : ${vlesslink1}" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "═══════════════════════════════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Link WS None TLS  : ${vlesslink2}" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "═══════════════════════════════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Created On        : $hariini" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Expired On        : $exp" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "═══════════════════════════════════════" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "Autoscript By Vinstechmy" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt
echo -e "" | tee -a /usr/local/etc/xray/configlogs/vlessws-$user.txt