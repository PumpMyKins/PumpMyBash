#!/bin/sh

#launching command
LAUNCH_ARG=""

#discord notifier option
WEBHOOK=""
SERVER_NAME=""

# crash-report option
FILE_PREFFIX="crash-"
CRASH_DIRECTORY="crash-report/"

function ctrl_c() {
	bash ./discord-notifier.sh --webhook-url=$WEBHOOK --text "$SERVER_NAME : Redémarrage automatique du serveur annulé depuis la console"
	echo "** Trapped CTRL-C"
	exit 1
}

a=1
while [ "$a" == 1 ]
do
	echo "Vous avez 6 secondes pour annuler le redémarrage avec la touche CTRL+C"
	trap ctrl_c INT
	sleep 6
	
	bash ./discord-notifier.sh --webhook-url=$WEBHOOK --text "$SERVER_NAME : Démarrage du serveur."

	exec $LAUNCH_ARG

	DATE=`date '+%Y-%m-%d_%H.%M.*'`
	echo "§FILE_PREFFIX$DATE"
	if [ -f "$FILE_PREFFIX$DATE" ];
	then
		echo "Crash-report found !"
		bash ./discord-notifier.sh --webhook-url=$WEBHOOK --text "$SERVER_NAME : Crash du serveur ?!? \n"
	else
		echo "No crash-report found."
		bash ./discord-notifier.sh --webhook-url=$WEBHOOK --text "$SERVER_NAME : Serveur arreté."
	fi

done
