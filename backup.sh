PORT=20422
HOST="yankee.pumpmykins.eu"
SSH_USER="backup-delta-ftb"
SOURCE_PATH="/ftbskyblock/thermos/"
DESTINATION_PATH="/backup-delta-ftb/"
WEBHOOK="https://discordapp.com/api/webhooks/551028131767648257/ORfnRQprOteu90Qnn8N1xVCkTm9Hh560tG02nYWQBTM8d24-PxjmlFdrf0iTGv34Vyl-"

echo $PORT
echo $HOST
echo $SSH_USER
echo $SOURCE_PATH
echo $DESTINATION_PATH

bash ~/discord.sh --webhook-url=$WEBHOOK --text "Server backup started !"

case "$1" in
        --init)
                echo "First complete backup !"
                rsync -avHP -e "ssh -p $PORT" --numeric-ids $SSH_USER@$HOST:$SOURCE_PATH "$DESTINATION_PATH/backup-last"
            ;;
        --inc)
                echo "Incremental backup !"
                rsync -auvHP -e "ssh -p $PORT" --numeric-ids --delete --backup --backup-dir="$DESTINATION_PATH/backup-old/$DATE" $SSH_$
                echo "Searching old directories"
                find "$DESTINATION_PATH/backup-old/" -type d -ctime +1 -exec rm -rf {} \;

            ;;
        --*) echo "bad option $1"
            ;;
        *) echo "argument $1"
            ;;
esac
echo "Discord Notifier"
bash ~/discord.sh --webhook-url=$WEBHOOK --text "Server backup finished !"
