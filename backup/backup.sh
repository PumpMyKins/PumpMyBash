#!/bin/sh

#discord notifier option
#!/bin/bash

FILE=setting.cfg
if [ -f $FILE ]; then
        echo "File $FILE exists."
        echo "Getting configurations"
else
        echo "File $FILE does not exist."
        echo "Downloading it"
        wget "
fi


bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --author "$SERVER_NAME-Backup" --author-icon "$WEBHOOK_ICON" --description "Démarrage de la sauvegarde du monde !"

rdiff-backup $ABSOLUTE_FOLDER_PATH $SSH_REMOTE_USER@$SSH_REMOTE_ADDRESS

bash ./discord-notifier.sh --webhook-url=$WEBHOOK_URL --author "$SERVER_NAME-Backup" --author-icon "$WEBHOOK_ICON" --description "Sauvegarde du monde terminée."
