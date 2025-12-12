## VLESS WS & NTLS Only (SUPPORT MULTIPATH/CUSTOMPATH FOR VLESS NTLS ONLY)

## SUPPORT AUTOBACKUP & BACKUP VIA TELEGRAM BOT
<b>
[  HTTP  ] <br>
<br>
-VLESS WEBSOCKET TLS (443) <br>
<br>
[  HTTPS  ] <br>
<br>
-VLESS WEBSOCKET NONE TLS (80) <br>
<br>
♦️ Please run this script if Xray Core is OFF after installation completed <br>

  ```html
 curl -L https://github.com/XTLS/Xray-core/releases/download/v25.10.15/Xray-linux-64.zip > Xray-linux-64.zip && unzip *.zip && mv xray /usr/local/bin && chmod +x /usr/local/bin/xray && rm *.zip *.dat LICENSE README.md
  ```
♦️ For Debian 10 to 12 (Latest) Only For First Time Installation (Update Repo) <br>

  ```html
 apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
  ```
  ♦️ For Ubuntu 18.04 to 24.04 (Latest) Only For First Time Installation (Update Repo) <br>
  
  ```html
 apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && reboot
 ```
♦️ Installation Link<br>

  ```html
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/vinstechmy/VlessWebsocket/main/INSTALL/setup.sh && chmod +x setup.sh && ./setup.sh
  ```
