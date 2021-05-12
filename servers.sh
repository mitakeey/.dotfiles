#!/bin/bash
# Script to setup afew things in a server

# colors
bold=`tput bold`
reset='\033[0m'
blue='\e[1;34m'
green='\e[1;32m'
brown='\e[0;33m'
no_color='\e[0m'
blink='\e[5m'


echo -e "\n"
echo -e "${bold}[+] ${reset}${brown}First doing a simple update and upgrade.\n${reset}"
sudo apt update -qq && sudo apt upgrade -qq -y
echo -e "\n"

echo -e "${bold}[+] ${reset}${brown}Installing some important packages for effeciency and productivity.\n${reset}"

echo -e "    ${bold}[>]${reset} ${green}Installing mosh and fzf.\n${reset}"
# install mosh and fzf
sudo apt install wget mosh fzf
echo -e "\n"

echo -e "    ${bold}[>]${reset} ${green}Installing tmux.\n${reset}"
# install tmux from github release files
sudo apt-get remove tmux -y -qq && sudo apt-get install -qq -y libevent-dev ncurses-dev build-essential bison pkg-config && \
curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep "browser_download_url.*" \
| grep "browser_download_url.*" | grep "tmux-.*.tar.gz" | cut -d : -f 2,3 \
| tr -d '"' | wget -qi - && tar -zxf tmux-*.tar.gz && cd tmux-*/ && ./configure && \
make && sudo make install && cd ../ && rm -r tmux-*
echo -e "\n"

echo -e "    ${bold}[>]${reset} ${green}Installing bat.\n${reset}"
# install bat from github relase files
curl -s https://api.github.com/repos/sharkdp/bat/releases/latest \
| grep "browser_download_url.*" \
| grep "bat_.*._amd64.deb" \
| cut -d : -f 2,3 \
| tr -d '"' \
| wget -qi - && sudo dpkg -i bat_*_amd64.deb && rm bat_*_amd64.deb
echo -e "\n"

# Get configuration files from github
echo -e "${bold}[+]${reset} ${brown}Downloading bashrc file from github.\n${reset}"
wget -q --show-progress https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/bashrc -P ~/
mv ~/.bashrc ~/.bashrc.original
mv ~/bashrc ~/.bashrc
echo -e "\n"

echo -e "${bold}[+]${reset} ${brown}Downloading tmux configuration file from github.\n${reset}"
wget -q --show-progress https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/tmux.conf -P ~/
mv ~/tmux.conf ~/.tmux.conf
echo -e "\n"

# clean up
echo -e "${bold}[+]${reset} ${brown}Cleaning up server.\n${reset}"
sudo apt autoremove -y && sudo apt remove -y && sudo apt clean
echo -e "\n"
rm ~/.wget-hsts
