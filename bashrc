#
# ~/.bashrc
#

# Wsparcie dla krzaczków:
setfont lat2-16

# Jeśli nie odpalamy w trybie interaktywnym to tu kończymy
[[ $- != *i* ]] && return

# konfiguracja promtu
PS1='[\u@\h \W]\$ '
alias ls='ls --color=auto'

#używamy vima
export EDITOR=vim

# FUNKCJE POMOCNICZE

color='\e[1;32m'
NC='\e[0m'

bold=`tput bold`
normal=`tput sgr0`

# Echo wyśrodkowane
echo_c() 
{
  w=$(stty size | cut -d" " -f2)       # width of the terminal
  l=${#1}                              # length of the string
  printf "%"$((l+(w-l)/2))"s\n" "$1"   # print string padded to proper width (%Ws)
}
# END FUNKCJE POMOCNICZE

# Aliasy
alias la='ls -lash' # long format - date, size, rights, 1file=1line
alias lt='ls -thor' # long format, sorted by modification time
alias las='ls -cltash'
alias :q='exit'		# vim influence
alias :Q='exit'
alias vi='vim'
alias tmux="tmux -2"
alias shred='shred -vufzn0' 
alias maria='mysql -p'

alias lcdoff='echo "\n\n\t\t\tCiemny ekran za 2 sekundy\n\n"; sleep 2; xset dpms force off'
alias rand50='for i in {1..50}; do echo -n  "$((RANDOM%100)) "; done; echo' # generate 50 random numbers
alias temperatura='watch -n1 "sensors|grep --color=never C"'
alias img='img2txt -W 146'
alias tonet="curl -F 'sprunge=<-' http://sprunge.us"

#lolbash
alias wtf='dmesg'
alias nomnom='killall'
alias gtfo='mv'
alias cya='reboot'

alias would_you_kindly='sudo'

source ~/.private_aliases

# END Aliasy

# MAIN
clear
reset

cal
