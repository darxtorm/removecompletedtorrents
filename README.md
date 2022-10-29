
## Installation ##
``` bash


#!/bin/bash
cd /tmp
git clone https://github.com/darxtorm/removecompletedtorrents.git
sudo cp /tmp/removecompletedtorrents.sh /usr/local/bin/removecompletedtorrents.sh
sudo chmod +x /usr/local/bin/removecompletedtorrents.sh
# crontab record to make it run at 3am daily, modify to suit
###write out current crontab
crontab -l > mycron
###echo new cron into cron file
echo "0 3 * * * /bin/bash /usr/local/bin/removecompletedtorrents.sh" >> mycron
###install new cron file
crontab mycron
rm mycron


```

needs no extra user documentation so, just make it executable and run or schedule it
