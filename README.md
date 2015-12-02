
## Installation ##
``` bash
cd ~
git clone https://github.com/darxtorm/removecompletedtorrents.sh.git
cd ~/removecompletedtorrents.sh
sudo chmod +x ./removecompletedtorrents.sh
ln ./removecompletedtorrents.sh /bin/removecompletedtorrents.sh
crontab -e
# crontab record to make it run at 3am daily, modify to suit
0 3 * * * /bin/bash /bin/removecompletedtorrents.sh
```

needs no extra user documentation so, just make it executable and run or schedule it
