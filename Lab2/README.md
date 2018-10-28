# Lab2

## How to

1. Create Vagrantfile
2. Start VM
3. Provision VM
    1. Install "mdadm"
    2. Count devices for RAID
    3. if devices > 4 then create RAID6
        1. Clean Supeblock
        2. Create RAID
        3. Create RAID conf
        4. Create 5 Partitions on RAID
        5. Create Filesystem on 5 Partitions
        6. Mount this Partitions
        7. Failed 1 drive in RAID
        8. Remove failed drive from RAID
        9. Add new drive to RAID
        10. Copy lab.log to Host

