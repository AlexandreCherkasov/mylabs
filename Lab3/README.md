# Lab3

## How to

1. Create Vagrantfile
2. Start VM
3. Provision VM
    1. Set timezone
    2. Install - xfsdump,vim-enhanced
4. Connect to VM over ssh
    1. List block devices
    2. Create 2 PV for LVM. Create LVM VG vg_tmp. Create LVM LV lv0_root 100% of vg_tmp
    3. Create XFS Filesystem on LV. Mount LV to /mnt
    4. Dump ROOT partition and Restore it on LV
    5. Chroot to LV. Change ROOT Partition in /etc/default/grub. Make new grub.cfg. Make new initramfs
    6. Reboot
    7. Check ROOT Partition on lv0_root
    8. Remove LV with original ROOT. Create Small LV for ROOT. 
    9. Create XFS FS for New ROOT-LV. Mount it
    10. Dump Temp ROOT partition and Restore it on New ROOT-LV
    11. Chroot to ROOT-LV. Change ROOT Partition in /etc/default/grub. Make new grub.cfg. Make new initramfs
    12. Create 2 PV for LVM Mirror. Create New LVM VG1. Create LVM LV Mirror for /var
    13. Create EXT4 FS on LV Mirror. Mount it.
    14. Move content /var to new LV
    15. Remount LV to /var. Add new /var to fstab
    16. Reboot
    17. Check ROOT and /var on New LV
    18. Remove Temp LV, VG, PV for ROOT
    19. Create New LV for /home. Create XFS FS on LV. Mount it
    20. Move content /home to New LV. Remount LV to /home. Add New /home to fstab.
    21. Create LVM Snapshot for /home. Change files on /home. Restore /home from Snapshot
    22. Work with BTRFS
        1. Create BTRFS RAID1. Mount it
        2. Add dev to BTRFS RAID
        3. Convert BTRFS RAID1 to RAID5
        4. Create BTRFS Subvolume. Create file on Subvolume
        5. Create Subvolume Snapshot
        6. Change file on Subvolume
        7. Restore from Snapshot: remove Subvolume, create Snapshot from Sub_snap. Remount New Subvolume.
        9. Move content /opt to BTRFS. Remount BTRFS as /opt. Add New /opt to fstab.
    23. Reboot
    24. Check Boot with BTRFS
