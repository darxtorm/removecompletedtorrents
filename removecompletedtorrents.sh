#!/bin/bash
## Made by darxtorm from these two scripts, good for outputting results to a file as a scheduled task
## lacks the --auth=user:password as i don't use auth on my server
## http://goedonthouden.com/2013/04/21/transmission-daemon-auto-remove-torrents/
## https://gist.github.com/bulljit/791609
echo "Getting torrent list from transmission"
TORRENTLIST=`transmission-remote --list | sed -e '1d;$d;s/^ *//' | cut --only-delimited --delimiter=' ' --fields=1`
for TORRENTID in $TORRENTLIST
do
  # grab a bunch of info about the torrent
  NAME_IRREGARDLESS=`transmission-remote --torrent $TORRENTID --info | grep "Name:"`
  DL_IRREGARDLESS=`transmission-remote --torrent $TORRENTID --info | grep "Percent Done:"`
  DL_COMPLETED=`transmission-remote --torrent $TORRENTID --info | grep "Percent Done: 100%"`
  STATE_IRREGARDLESS=`transmission-remote --torrent $TORRENTID --info | grep "State:"`
  STATE_STOPPED=`transmission-remote --torrent $TORRENTID --info | grep "State: Finished"`
  ## commented out and replaced below as i only want finished torrents, you may edit accordingly
  #STATE_STOPPED=`transmission-remote --torrent $TORRENTID --info | grep "State: Stopped\|Finished\|Idle"`
  echo "#$TORRENTID $NAME_IRREGARDLESS"
  # check if the torrent is complete and is in finished state and remove
  if [ "$DL_COMPLETED" != "" ] && [ "$STATE_STOPPED" != "" ]; then
    echo "Torrent #$TORRENTID is $DL_COMPLETED and $STATE_STOPPED."
    echo "Removing torrent #$TORRENTID from list."
    transmission-remote --torrent $TORRENTID --remove
  else
    echo "Torrent #$TORRENTID is not completed. $DL_IRREGARDLESS $STATE_IRREGARDLESS"
  fi
done
