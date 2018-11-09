# Lab4

## How to

1. Create Vagrantfile
2. Start VM
3. Provision VM
    1. Set timezone
4. Connect to VM over ssh

GET SHELL WITHOUT PASSWORD
1. Using rd.break
    1. Press "Esc" to get GRUB Menu
    2. Edit parameters in cmdline: remove 'console=tty0 console=ttyS0,115200n8', remove 'rhgb quiet', add 'rd.break enforcing=0'
    3. Press "Ctrl-x" to start
    4. Booting
    5. Remount /sysroot in 'rw' mode
    6. Chroot /sysroot
    7. Change password for root
    8. Create /.autorelabel
    9. Exit chroot
    10. Exit to finish boot
2. Using init
    1. Press "Esc" to get GRUB Menuroot
    2. Edit parameters in cmdline: remove 'console=tty0 console=ttyS0,115200n8', remove 'rhgb quiet', add 'init=/sysroot/bin/sh'
    3. Press "Ctrl-x" to start
    4. Booting
    5. Remount /sysroot in 'rw' mode
    6. Chroot /sysroot
    7. Change password for root
    8. Create /.autorelabel
    9. Exit chroot
    10. Reboot
3. Using Rescue mode
    1. Add System install iso to Vagrantfile
    2. Restart box to load from Install CD
    3. Switch to VirtualBox Manager, open box console
    4. In Boot Menu select 'Troubleshooting'
    5. At the next Menu, select 'Rescue a CentOS system'
    6. Booting rescue, select '1) Continue'
    7. Press 'Enter' to get a shell
    8. Chroot /mnt/sysimage
    9. Change password for root
    10. Remove /.autorelabel
    11. Exit chroot
    12. Exit
    13. Comment string with Install iso in Vagrantfile


RENAME VOLUME GROUP
1. Get devices list. Get VG Name
2. Rename VG to new name
3. Mount NewVG ROOT LV in /mnt/. Mount /dev /proc /sys /run /boot to /mnt
4. Chroot to /mnt
5. Change VG Name in fstab
6. Change VG Name in /etc/default/grub
7. Make Grub config for New VG Name
8. Make initramfs for New VG Name
9. Exit chroot
10. Reboot
11. Check boot with NEW VG Name

ADD MODULE TO INITRD
1. Create Module for display of logo "OTUS" during boot
2. Copy Module Dir to Dracut Modules Dir
3. Make initramfs with new Module
4. Reboot
5. Check Boot log for new Module
6. Copy messages.log with result new Module
