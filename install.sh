#!/usr/bin/env bash
## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')" GREEN="$(printf '\033[32m')" ORANGE="$(printf '\033[33m')" BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')" CYAN="$(printf '\033[36m')" WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')" GREENBG="$(printf '\033[42m')" ORANGEBG="$(printf '\033[43m')" BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')" CYANBG="$(printf '\033[46m')" WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

## Banner
clear
cat <<-_EOF_
	${CYAN}┌─────────────────────────────────────────────────────────────────────────────┐
	│  ${MAGENTA}       __            __        __       __               __                ${CYAN}│
	│  ${MAGENTA}.-----|  .-----.----|  |_.----|__.----.|  |_.---.-.-----|  |_.----.---.-.  ${CYAN}│
	│  ${MAGENTA}|  -__|  |  -__|  __|   _|   _|  |  __||   _|  _  |     |   _|   _|  _  |  ${CYAN}│
	│  ${MAGENTA}|_____|__|_____|____|____|__| |__|____||____|___._|__|__|____|__| |___._|  ${CYAN}│
	└─────────────────────────────────────────────────────────────────────────────┘
_EOF_

echo
echo ${GREEN} Installing node dependencies
echo
yarn && yarn build
echo
echo ${GREEN} Node Dependencies Complete
echo ${CYAN} Installing Theme locally and globally
sudo cp -rvf dist/dhumavati/* /usr/share/themes/dhumavati
sudo cp -rvf dist/* /usr/share/themes/dhumavati-light
mkdir -p ~/.local/share/themes/dhumavati && cp -rvf dist/dhumavati/* ~/.local/share/themes/dhumavati
mkdir -p ~/.local/share/themes/dhumavati-light && cp -rvf dist/* ~/.local/share/themes/dhumavati-light
echo ${RED} Installation Complete
