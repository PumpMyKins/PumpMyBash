#!/bin/sh

#launching command
LAUNCH_ARG=""

#discord notifier option
WEBHOOK=""

# crash-report option
FILE_PREFFIX="crash*.txt"
CRASH_DIRECTORY="crash-report/"

function ctrl_c() {
        echo "** Trapped CTRL-C"
        exit 1
}

a=1
while [ "$a" == 1 ]
do
	trap ctrl_c INT
	sleep 5
	
	bash ./discord.sh --webhook-url=$WEBHOOK --text "Démarrage du serveur."

	exec $LAUNCH_ARG

	if [ -f "$FILE_PREFFIX" ];
	then
    	echo "Crash-report found !"
		bash ./discord.sh --webhook-url=$WEBHOOK --text "Crash du serveur ?!? \n"
	else
    	echo "No crash-report found."
    	bash ./discord.sh --webhook-url=$WEBHOOK --text "Serveur arreté."
	fi

done
