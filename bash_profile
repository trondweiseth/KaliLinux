ali() {
inp1=$1
inp2=$2
if [ -z $1 ] || [ -z $2 ]; then
        echo "Missing arguments. Use: ali ALIAS 'ACTION'"
else
        echo "alias $inp1='$inp2'" >> ~/.zshrc
        source ~/.zshrc
fi
}

quickscan() {
~/Tools/pingsweep.sh $@ > ~/pingsweepresult
SCANS=$(cat ~/pingsweepresult|wc -l)
echo $null > ~/nscan
echo "Scans: $SCANS"
for ip in $(cat ~/pingsweepresult); do (nmap -Pn $ip &) >> ~/nscan;done
tail -f ~/nscan
}

changestring() {
        help() {
                echo "Syntax: changestring ['From'] ['To'] [Filename]"
        }

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]; then
        help
else
        if [[ -f $3 ]]; then
                sed -i "s/${1}/${2}/g" $3
        else
                echo "The file does not exist"
        fi
fi
}

mtheme() {

        currentstyle=$(cat .config/rofi/launchers/colorful/launcher.sh | grep "theme=" | grep "style_" | cut -d '"' -f2)
        echo "Current style: $currentstyle"
        styles=("style_1" "style_2" "style_3" "style_4" "style_5" "style_6" "style_7" "style_8" "style_9" "style_10" "style_11" "style_12")
        select style in "${styles[@]}"
        do
                sed -i "s/theme=\"$currentstyle\"/theme=\"$style\"/g" .config/rofi/launchers/colorful/launcher.sh
                break
        done
}

kjob() {
        kill $(jobs -p | grep -Eo '[0-9]{4,10}')
}

autonmap () {
        help() {
                echo "Syntax: htbnmap [ip] [foldername]"
        }
        if [ -z $1 ] || [ -z $2 ]; then
                help
        else
                mkdir nmap/$2
                cd nmap/$2
                sudo nmap -sC -sV $1 -oA $2
                xsltproc $2.xml -o $2.html
        fi
}

htbproject() {

        help() {
        echo "Syntax: htbnproject [Project name]"
        }
        if [ -z $1 ]; then
                help
        else
                mkdir ~/htb/$1
                mkdir ~/htb/$1/nmap
                mkdir ~/htb/$1/notes
                mkdir ~/htb/$1/files
                ~/htb/$1
        fi
}

thmproject() {

        help() {
        echo "Syntax: thmproject [Project name]"
        }
        if [ -z $1 ]; then
                help
        else
                mkdir ~/thm/$1
                mkdir ~/thm/$1/nmap
                mkdir ~/thm/$1/notes
                mkdir ~/thm/$1/files
                ~/thm/$1
        fi
}

process() {
        ps aux | grep $@ | grep -v grep
}

curl http://wttr.in/baerum?0F

alias pp='vim $HOME/.zshrc'
alias sp='source $HOME/.zshrc'
alias cls='clear'
alias update='sudo apt update -y && sudo apt upgrade -y'
alias cr='sudo chmod +x $@'
alias pingsweep='$HOME/Tools/pingsweep.sh'
alias v='vim'
alias ls='lsd'
alias ll='lsd -al'
alias lt='ls --tree'
alias mssqlclient='python3 /usr/share/doc/python3-impacket/examples/mssqlclient.py'
alias psexec='/usr/bin/impacket-psexec'
alias xcp='xclip -selection clipboard'
alias htblab='sudo openvpn $HOME/htbvpn/lab_TWM.ovpn &'
alias htbstartingpoint='sudo openvpn $HOME/htbvpn/starting_point_TWM.ovpn &'
alias vpnkill='sudo pkill openvpn'
alias htbreleasearena='sudo openvpn ~/htbvpn/release_arena_TWM.ovpn &'
alias thmvpn='sudo openvpn $HOME/thmvpn/tweiseth.ovpn &'
alias hosts='sudo vim /etc/hosts'
alias pl='cat .zshrc | grep "()" | tr -d "(){}" | tr -d [:blank:] | grep -v help ; alias | cut -d "=" -f1'
alias macaddressfinder='zsh $HOME/macaddressfinder.sh'
alias macgrep='grep -o -E "([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}"'
alias install='sudo apt install'
alias uninstall='sudo apt remove'
alias bloodhound='python3 $HOME/Tools/BloodHound.py/bloodhound.py'
alias evil-winrm='ruby $HOME/Tools/evil-winrm/evil-winrm.rb'
alias responder='python $HOME/Tools/evil-winrm/Responder/Responder.py'
