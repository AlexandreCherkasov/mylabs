# Lab5

## How to

1. Create Vagrantfile
2. Start VM
3. Provision VM
    1. Set timezone
    2. Install - vim-enhanced, mailx
    3. Install and Run Lab5 Script
       1. Copy "parsenginxlog" script to /etc/cron.hourly/
       2. Run "parsenginxlog". Script out to /vagrant/lab5_<date-time>.log and Send report to Vagrant user
          Script parse nginx log files every hour and count Top IPs, Top URLs, Codes, Errors
4. "lab5.png" - algorithm diagram
