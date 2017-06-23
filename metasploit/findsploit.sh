#!/bin/bash
# Findsploit v1.5 by 1N3 @CrowdShield
# https://crowdshield.com
#
# Finsploit is a simple bash script to quickly and easily search both local and online exploit databases.
#
# INSTALLATION
#  run ./install.sh
#
# This script uses the local exploit-db database for exploits. To install this database locally, use the update.sh script under the exploitdb folder first. You will also need to install nmaps script database locally in /usr/share/nmap/scripts/ for the script to work.
#
# For updates to this script, use git clone https://github.com/1N3/Findsploit.git
#
# 2017-06-16 - Updated by @xstevens to use printf rather than echo -e, made grep cmd a variable and other customizations for my setup

clear

VER='1.5'
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SEARCHSPLOIT_SCRIPT="$(which searchsploit)" # PATH TO THE EXPLOITDB SEARCH SCRIPT
NMAP_SCRIPTS="/usr/share/nmap/scripts" # PATH TO NMAP SCRIPTS 
MSFCONSOLE="$(which msfconsole)"
BROWSER_CMD='open' # SET THE BROWSER COMMAND HERE
GREP_CMD='rg'
VAR1=$1;
VAR2=$2;
VAR3=$3;
VARS="$1 $2 $3";
COLOR1='\033[91m'
COLOR2='\033[1m\033[92m'
COLOR3='\033[1m'
RESET='\e[0m'

printf "$COLOR3   ___ _           _           _       _ _   \n"
printf "$COLOR3  / __(_)_ __   __| |___ _ __ | | ___ (_) |_ \n"
printf "$COLOR3 / _\ | | '_ \ / _\` / __| '_ \| |/ _ \| | __|\n"
printf "$COLOR3/ /   | | | | | (_| \__ \ |_) | | (_) | | |_ \n"
printf "$COLOR3\/    |_|_| |_|\__,_|___/ .__/|_|\___/|_|\__|\n"
printf "$COLOR3                        |_|                  \n"
echo ""
printf "$COLOR1+ -- --=[findsploit v$VER by 1N3 + @xstevens\n"
printf "$COLOR1+ -- --=[https://crowdshield.com$RESET\n"
echo ""
if [ -z "$1" ]; 
then
    printf "$COLOR1+ -- --=[Usage: findsploit windows xp remote, etc.\n"
    echo ""
    echo ""
    exit;
else
    printf "$COLOR1+ -- --=[SEARCHING: $COLOR2 $VARS $RESET\n"
    echo ""
    printf "$COLOR1+ -- --=[NMAP SCRIPTS$RESET\n"
    echo ""
    $GREP_CMD -i "$VAR1" -g '*.nse' $NMAP_SCRIPTS | $GREP_CMD -i "$VAR2" --color=auto | $GREP_CMD -i "$VAR3" --color=auto | head -1
    echo ""
    printf "$COLOR1+ -- --=[METASPLOIT EXPLOITS$RESET\n"
    echo ""
    # if we haven't cached Metasploit's list then do so
    if [ ! -f /tmp/findsploit-msf-search.cache ]; then
        printf "Building MSF search cache ... \n"
        $MSFCONSOLE -q -x 'search  ; exit' -o /tmp/findsploit-msf-search.cache
    fi
    $GREP_CMD -i "$VAR1" /tmp/findsploit-msf-search.cache | $GREP_CMD -i "$VAR2" --color=auto | $GREP_CMD -i "$VAR3" --color=auto 
    echo ""
    printf "$COLOR1+ -- --=[EXPLOITDB EXPLOITS$RESET\n"
    echo ""
    $SEARCHSPLOIT_SCRIPT $VARS 
    echo ""
    # printf "$COLOR2+ -- --=[Press any key to search online or Ctrl+C to exit...$RESET\n"
    # read test
    # $BROWSER_CMD 2> /dev/null &
    # sleep 5
    # $BROWSER_CMD 'https://www.exploit-db.com/search/?action=search&description='$VAR1'+'$VAR2'+'$VAR3'&e_author=' 2>/dev/null
    # $BROWSER_CMD 'https://www.google.com/search?q='$VAR1'%20'$VAR2'%20'$VAR3'+exploit' 2>/dev/null 
    # $BROWSER_CMD 'https://www.google.com/search?q='$VAR1'%20'$VAR2'%20'$VAR3'+exploit+site:www.securityfocus.com' 2> /dev/null
    # $BROWSER_CMD 'https://www.google.com/search?q='$VAR1'%20'$VAR2'%20'$VAR3'+site:0day.today' 2> /dev/null
    # $BROWSER_CMD 'https://www.google.com/search?q='$VAR1'%20'$VAR2'%20'$VAR3'+site:www.security-database.com' 2> /dev/null
    # $BROWSER_CMD 'https://www.google.com/search?q='$VAR1'%20'$VAR2'%20'$VAR3'+site:packetstormsecurity.com' 2> /dev/null
    # $BROWSER_CMD 'https://exploits.shodan.io/?q='$VAR1'+'$VAR2'+'$VAR3 2> /dev/null
fi
exit
