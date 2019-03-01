#!/bin/sh

PORT=
HOST=""
SSH_USER=""
SOURCE_PATH=""
DESTINATION_PATH=""
WEBHOOK=""

echo $PORT
echo $HOST
echo $SSH_USER
echo $SOURCE_PATH
echo $DESTINATION_PATH

bash ./discord.sh --webhook-url=$WEBHOOK --text "Server backup started !"

FILE=".backup-date"   
if [ -f $FILE ]; then
    FILE_CONTENT=$(cat $FILE)
    echo "File $FILE exists. DATE => $FILE_CONTENT"
    echo "Incremental backup !"
    rsync -auvHP -e "ssh -p $PORT" --numeric-ids --delete --backup --backup-dir="$DESTINATION_PATH/backup-old/$FILE_CONTENT" $SOURCE_PATH $SSH_USER@$HOST:"$DESTINATION_PATH/backup-last"

else
    echo "File $FILE does not exist."
    echo "First complete backup !"
    rsync -avHP -e "ssh -p $PORT" --numeric-ids $SOURCE_PATH $SSH_USER@$HOST:"$DESTINATION_PATH/backup-last"
fi

echo $DATE > $FILE

echo "Discord Notifier"
bash ./discord.sh --webhook-url=$WEBHOOK --text "Server backup finished !"
