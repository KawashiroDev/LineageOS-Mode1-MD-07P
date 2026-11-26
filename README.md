# LineageOS-Mode1-MD-07P
LineageOS for the Mode1 Pocket MD-07P

-----
<a href="https://github.com/KawashiroDev/LineageOS-Mode1-MD-07P/blob/main/Installing.md">Installing</a> \
<a href="https://github.com/KawashiroDev/LineageOS-Mode1-MD-07P/blob/main/After_installing.md">After Installing</a>

-----
#### Untested features
- LTE video calling - Unsupported on EE
- OIRT FM reception - The UK doesn't use those frequencies
- Gapps - I use MicroG

-----

#### Additional features over stock
- Lower display brightness - The brightness slider allows you to dim the screen further than stock allowed
- OIRT FM band support - The FM chip in the phone allows tuning from 64-108MHz but the stock FM app only allowed tuning to 76-108MHz
- Root - Uses SukiSU Nova
- Increased display brightness:\
(Settings > Display > Brightness boost)\
This disables MediaTek's AAL to make the screen approximately 50% brighter\
**Use with caution, May cause hardware damage** 

- GPU boost:\
(Settings > System > GPU boost)\
The Mali G57 has a frequency and voltage profile present for 1.1GHz from MediaTek\
Stock runs at 1003MHz maximum, This toggle enables it to run at 1.1GHz


-----

#### Links
Device tree - https://github.com/KawashiroDev/android_device_mode1_md07p/tree/md07p-bringup-fixes \
Vendor - https://github.com/KawashiroDev/android_vendor_mode1_md07p \
Kernel - https://github.com/KawashiroDev/android_device_mode1_md07p-kernel

-----

#### AI disclaimer
Claude was used when working on this ROM

-----
#### Credits


2by2-Project-Devices for the initial device tree - https://github.com/2by2-Project-Devices/android_device_mode1_md07p

Ummmbra on XDA - https://xdaforums.com/t/guide-unlock-root-gsi-p-up-world-mode1-pocket-md-07p.4775724/
