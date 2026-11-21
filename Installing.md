# Installing LineageOS

**Make a backup of your partitions first using either SP Flash Tool or MTKClient first!** \
If using SP Flash Tool use the scatter file from this XDA thread - https://xdaforums.com/t/guide-unlock-root-gsi-p-up-world-mode1-pocket-md-07p.4775724/

-----
Enable OEM unlocking in developer options then reboot to bootloader mode and unlock the bootloader

Flash one of the vendor boot images from this repo depending on what software version your phone is running \
fastboot flash vendor_boot <path to .img>

Reboot to recovery \
Format Data and install a lineageos zip from releases \
(Optional) Reboot to fastboot and install the magisk boot img
