
## Installation ##
cd ~
git clone https://github.com/darxtorm/removecompletedtorrents.sh.git
cd ~/removecompletedtorrents.sh
sudo chmod +x ./removecompletedtorrents.sh
ln ./removecompletedtorrents.sh /bin/removecompletedtorrents.sh
crontab -e
0 3 * * * /bin/bash /bin/removecompletedtorrents.sh

doesn't yet remove the torrents as i wish to test it correctly with a torrent that has 'finished' due to inactivity rather than seeding completion. needs no extra user documentation so, just make it executable and run or schedule it
