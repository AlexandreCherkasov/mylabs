# Lab6

## How to

1. Create Vagrantfile
2. Start VM
3. Provision VM
    1. Set timezone
    2. Install - vim-enhanced
    3. Install and Run Lab6 Script Init Version
       1. Copy lab6.init script to /usr/bin/lab6
       2. Copy lab6.sysconfig to /etc/sysconfig/lab6
       3. Copy lab6d.init to /etc/init.d/lab6d
       4. Start lab6d daemon. Script out to /vagrant/lab6-init.log
    4. Install and Run Lab6 Script Systemd Version
       1. Stop and Remove lab6d Init version
       2. Copy lab6.systemd script to /usr/bin/lab6
       3. Copy lab6d.service to /etc/systemd/system/
       4. Enable and Start lab6d daemon. Script out to /vagrant/lab6-systemd.log
