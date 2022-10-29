
## Installation ##
``` bash


#!/bin/bash
sudo touch /tmp/sudo_test
echo "pulling down repo and unpacking to temp folder"
cd /tmp && git clone https://github.com/darxtorm/removecompletedtorrents.git
echo "placing the script in /usr/local/bin and making it executable"
sudo cp /tmp/removecompletedtorrents.sh /usr/local/bin/removecompletedtorrents.sh
sudo chmod +x /usr/local/bin/removecompletedtorrents.sh
### ask user if they wish to continue
read -p "now we are going to make a cronjob to run this a scheduled task. press enter to continue, or Ctrl+c to stop here"
### crontab record to make it run at 3am daily, modify to suit
###write out current crontab
crontab -l > mycron
###echo new cron into cron file
echo "0 3 * * * /bin/bash /usr/local/bin/removecompletedtorrents.sh" >> mycron
###install new cron file
crontab mycron
rm mycron
echo "all done. run removecompletedtorrents.sh to manually clean things up"

```

needs no extra user documentation so, just make it executable and run or schedule it. the installation will 
