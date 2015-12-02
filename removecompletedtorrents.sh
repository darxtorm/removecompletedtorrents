#!/bin/sh
## Made by JD from these two scripts, good for outputting results to a file as a scheduled task
## lacks the --auth=user:password as i don't use auth on my server
## http://goedonthouden.com/2013/04/21/transmission-daemon-auto-remove-torrents/
## https://gist.github.com/bulljit/791609
TORRENTLIST=`transmission-remote --list | sed -e '1d;$d;s/^ *//' | cut --only-delimited --delimiter=' ' --fields=1`
echo "Getting torrent list from transmission"

for TORRENTID in $TORRENTLIST
do
## found these too noisy for output
#echo "* * * * * Operations on torrent ID $TORRENTID starting. * * * * *"

NAME_IRREGARDLESS=`transmission-remote --torrent $TORRENTID --info | grep "Name:"`
DL_IRREGARDLESS=`transmission-remote --torrent $TORRENTID --info | grep "Percent Done:"`
DL_COMPLETED=`transmission-remote --torrent $TORRENTID --info | grep "Percent Done: 100%"`
STATE_IRREGARDLESS=`transmission-remote --torrent $TORRENTID --info | grep "State:"`
## commented out and replaced below as i only want finished torrents, you may edit accordingly
#STATE_STOPPED=`transmission-remote --torrent $TORRENTID --info | grep "State: Stopped\|Finished\|Idle"`
STATE_STOPPED=`transmission-remote --torrent $TORRENTID --info | grep "State: Finished"`
echo "#$TORRENTID $NAME_IRREGARDLESS"

if [ "$DL_COMPLETED" != "" ] && [ "$STATE_STOPPED" != "" ]; then
echo "Torrent #$TORRENTID is $DL_COMPLETED and $STATE_STOPPED."
echo "Removing torrent #$TORRENTID from list."
#transmission-remote --torrent $TORRENTID --remove
echo "JOKES NOT REALLY, UNCOMMENT LINE ABOVE TO GIVE ME TEETH"

else
echo "Torrent #$TORRENTID is not completed. $DL_IRREGARDLESS $STATE_IRREGARDLESS"
fi

## found these too noisy for output
#echo "* * * * * Operations on torrent ID $TORRENTID completed. * * * * *"
done
