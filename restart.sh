#!/bin/sh

#launching command
LAUNCH_ARG=""

#discord notifier option
WEBHOOK_URL=""
WEBHOOK_ICON=""
SERVER_NAME=""

# crash-report option
FILE_PREFFIX="crash-"
CRASH_DIRECTORY="crash-report/"

function ctrl_c() {
        bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --author "$SERVER_NAME" --author-icon "$WEBHOOK_ICON" --description "Redémarrage automatique du serveur annulé depuis la console"
        echo "** Trapped CTRL-C"
        exit 1
}


while :
do
        DATE=`date '+%Y-%m-%d_%H.%M'`
        echo "Vous avez 6 secondes pour annuler le redémarrage avec la touche CTRL+C"
        trap ctrl_c INT
        sleep 6

        bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --author "$SERVER_NAME" --author-icon "$WEBHOOK_ICON" --description "$DATE Démarrage du serveur."

        $LAUNCH_ARG

        DATE=`date '+%Y-%m-%d_%H.%M.*'`
        echo "$FILE_PREFFIX$DATE"
        if [ -f "$CRASH_DIRECTORY/$FILE_PREFFIX$DATE.*" ];
        then
                echo "Crash-report found !"
                bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --author "$SERVER_NAME" --author-icon "$WEBHOOK_ICON" --description "$DATE Crash du serveur ?!? \n" --text "@here"
        else
                echo "No crash-report found."
                bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --author "$SERVER_NAME" --author-icon "$WEBHOOK_ICON" --description "$DATE Serveur arreté ."
        fi

done
