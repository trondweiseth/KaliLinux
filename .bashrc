getssid() {
	
	for ssid in $(cat $* | cut -d "*" -f 4)
       	do 
		ssout=$(echo $ssid|xxd -r -ps)
		text="SSID for $ssid: $ssout"
		length=${#text}
		line=$(for a in $(seq 1 $length); do echo -n '-'; done)
		echo -e "$YELLOW SSID for $RED$ssid\e[m: $BLUE$ssout\e[m"
		echo -e "$CYAN $line\e[m"
	done
}

alias ss='. ~/.bashrc'
alias pp='vim ~/.bashrc'
alias v='vim'
alias cr='chmod +x'
alias cls='clear'
alias ll='ls -la'
alias pattern-create='/usr/bin/msf-pattern_create'
alias update='apt update -y && apt upgrade -y'
alias xcp='xclip -selection clipboard'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'
