#!/bin/sh

#launching command
LAUNCH_ARG=""

#discord notifier option
WEBHOOK_URL=""
WEBHOOK_ICON=""
SERVER_NAME=""

# crash-report option
function ctrl_c() {
        bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --username "$SERVER_NAME" --avatar "$WEBHOOK_ICON" --description "Redémarrage automatique du serveur annulé depuis la console"
        echo "** Trapped CTRL-C"
        exit 1
}


while :
do
        trap ctrl_c INT
        DATE=`date '+%Y-%m-%d_%H.%M'`
        bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --username "$SERVER_NAME" --avatar "$WEBHOOK_ICON" --description "$DATE Démarrage du serveur."

        $LAUNCH_ARG


        DATE=`date '+%Y-%m-%d_%H.%M'`
        bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --username "$SERVER_NAME" --avatar "$WEBHOOK_ICON" --description "$DATE Serveur arreté."
        
        echo "Vous avez 6 secondes pour annuler le redémarrage avec la touche CTRL+C"
        trap ctrl_c INT
        sleep 6


done
