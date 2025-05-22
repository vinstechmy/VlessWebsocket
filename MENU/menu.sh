#!/bin/bash
NC='\e[0m'
## Foreground
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'

MYIP=$( curl -sS https://raw.githubusercontent.com/vinstechmy/VlessWebsocket/main/ACCESS/access | awk '{print $2}' )

xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then
   status_xray="${GB}ON${NC}"
else
   status_xray="${RB}OFF${NC}"
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then
   status_nginx="${GB}ON${NC}"
else
   status_nginx="${RB}OFF${NC}"
fi

# // script version
myver="$(cat /home/ver)"

# // script version check
serverV=$( curl -sS https://raw.githubusercontent.com/vinstechmy/VlessWebsocket/main/UPDATE/version)

# // update script if available
function updatews(){
clear
echo -e "[ ${GREEN}INFO${NC} ] Check for Script updates . . ."
sleep 1
cd
wget -q -O /root/update.sh "https://raw.githubusercontent.com/vinstechmy/VlessWebsocket/main/UPDATE/update.sh" && chmod +x update.sh && ./update.sh
sleep 1
rm -f /root/update.sh
rm -f /home/ver
version_check=$( curl -sS https://raw.githubusercontent.com/vinstechmy/VlessWebsocket/main/UPDATE/version)
echo "$version_check" >> /home/ver
clear
echo ""
echo -e "[ ${GREEN}INFO${NC} ] Successfully Up To Date!"
sleep 1
echo ""
read -n 1 -s -r -p "Press any key to continue..."
menu
}

domain=$(cat /usr/local/etc/xray/domain)
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
WKT=$(cat /usr/local/etc/xray/timezone)
MYIP2=$(curl -sS ipv4.icanhazip.com)
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
ram_used=$(free -m | grep Mem: | awk '{print $3}')
total_ram=$(free -m | grep Mem: | awk '{print $2}')
ram_usage=$(echo "scale=2; ($ram_used / $total_ram) * 100" | bc | cut -d. -f1)
daily_usage=$(vnstat -d --oneline | awk -F\; '{print $6}' | sed 's/ //')
monthly_usage=$(vnstat -m --oneline | awk -F\; '{print $11}' | sed 's/ //')

clear
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 INFO SERVER                \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e " ${YB}System Uptime${NC}    ${WB}: $SERONLINE${NC}"
echo -e " ${YB}Memory Usage${NC}     ${WB}: ${ram_used}MB / ${total_ram}MB (${ram_usage}%)${NC}"
echo -e " ${YB}ISP Provider${NC}     ${WB}: $ISP${NC}"
echo -e " ${YB}Timezone${NC}         ${WB}: $WKT${NC}"
echo -e " ${YB}City${NC}             ${WB}: $CITY${NC}"
echo -e " ${YB}IP Address${NC}       ${WB}: $MYIP2${NC}"
echo -e " ${YB}Domain${NC}           ${WB}: $domain${NC}"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "      [ XRAY-CORE${NC} : ${status_xray} ]  [ NGINX${NC} : ${status_nginx} ]"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e "          \033[1;37mVLESS WEBSOCKET BY VINSTECHMY\033[0m"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "     ${WB}----- [ Bandwidth Monitoring ] -----${NC}"
echo -e ""
echo -e " Daily Data Usage   :  ${YB}$daily_usage${NC}"
echo -e " Monthly Data Usage :  ${YB}$monthly_usage${NC}"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                VLESS MENU                  \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m1 \033[0m] ${RB}•${NC} XRAY Vless WS Panel"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                OTHERS MENU                 \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m2 \033[0m] ${RB}•${NC} DNS Changer
 [\033[1;36m3 \033[0m] ${RB}•${NC} Netflix Checker
 [\033[1;36m4 \033[0m] ${RB}•${NC} Limit Bandwith Speed"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                SYSTEM MENU                 \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m5 \033[0m] ${RB}•${NC} Change Domain
 [\033[1;36m6 \033[0m] ${RB}•${NC} Renew Certificate
 [\033[1;36m7 \033[0m] ${RB}•${NC} Check VPN Status
 [\033[1;36m8 \033[0m] ${RB}•${NC} Check VPN Port
 [\033[1;36m9 \033[0m] ${RB}•${NC} Restart VPN Services
 [\033[1;36m10\033[0m] ${RB}•${NC} Speedtest VPS
 [\033[1;36m11\033[0m] ${RB}•${NC} Check RAM Usage
 [\033[1;36m12\033[0m] ${RB}•${NC} Backup Data Via Telegram Bot
 [\033[1;36m13\033[0m] ${RB}•${NC} Backup & Restore
 [\033[1;36m14\033[0m] ${RB}•${NC} Reboot VPS
"
if [[ $serverV > $myver ]]; then
echo -e " [\033[1;36m15\033[0m] ${RB}•${NC} Update Autoscript To V$serverV\n"
up2u="updatews"
else
up2u="menu"
fi
echo -e " \033[1;37mType [ x ] To Exit From Menu \033[0m"
echo -e ""
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " Version       :\033[1;36m Vless Websocket $myver\e[0m"
echo -e " Autoscript By : ${GB}Vinstechmy${NC}"
echo -e " Status Script : ${CB}Latest${NC}"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e ""
read -p " Select Menu :  "  opt
case $opt in
1) clear ; menu-vless ;;
2) clear ; dns ; echo "" ; menu ;;
3) clear ; nf ; echo "" ; read -n1 -r -p "Press any key to continue..." ; menu ;;
4) clear ; limit ; echo "" ; menu ;;
5) clear ; add-host ;;
6) clear ; certxray ;;
7) clear ; status ; read -n1 -r -p "Press any key to continue..." ; menu ;;
8) clear ; cekport ;;
9) clear ; restart ; menu ;;
10) clear ; speedtest ; echo "" ; read -n1 -r -p "Press any key to continue..." ; menu ;;
11) clear ; ram ; menu ;;
12) clear ; backupmenu ; menu ;;
13) clear ; get-backres ;;
14) clear ; reboot ;;
15) clear ; $up2u ; read -n1 -r -p "Press any key to continue..." ; menu ;;
00 | 0) clear ; menu ;;
x | X) exit ;;
*) clear ; menu ;;
esac
