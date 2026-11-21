# Installing LineageOS 23.2 on the Mode1 Pocket (MD-07P)

First-time install from stock firmware.

**Make a backup of your partitions first using either SP Flash Tool or MTKClient first!** \

**This erases everything on the phone.** Back up first. You need `adb` and `fastboot`
(Android platform-tools) on a computer, a USB cable, and these files from this github repo:

- `lineage-23.2-<date>-UNOFFICIAL-md07p.zip`
- `vbmeta.img`
- the `lineage-recovery-vendor_boot-stock<version>.img` that matches your phone (see step 3)

## 1. Unlock the bootloader

1. On the phone, open Settings > About phone and tap *Build number* seven times.
2. In Settings > System > Developer options, turn on *OEM unlocking* and *USB debugging*.
3. Connect the phone, accept the USB debugging prompt, then:

   ```bash
   adb reboot bootloader
   fastboot flashing unlock     # confirm on the phone; this wipes it
   ```

## 2. Disable verified boot

Still in fastboot, check the active slot (normally `a`) and flash `vbmeta` with
verification disabled:

```bash
fastboot getvar current-slot
fastboot --disable-verity --disable-verification flash vbmeta_a vbmeta.img
```

Use the slot reported by `current-slot` in place of `_a` here and in step 3.

## 3. Flash Lineage Recovery

On this phone the recovery lives in `vendor_boot`, which also holds the kernel modules used
at early boot. Use a recovery `vendor_boot` that matches the stock firmware on the phone, so
stock Android still boots if you stop before installing:

```bash
fastboot flash vendor_boot_a lineage-recovery-vendor_boot-stock<version>.img
fastboot reboot recovery
```

Pick the image by the stock build number in Settings > About phone: `stockv1.7` for
V1.7, `stockv1.18` for V1.17 or V1.18.

If `fastboot reboot recovery` boots Android instead, run `adb reboot recovery`.

## 4. Copy slot A's firmware to slot B

**Do not skip this.** Stock MD-07P units can ship with empty slot B firmware partitions. The
Lineage zip installs to the other slot and does not carry firmware, so an empty slot B will
not boot.

In recovery, choose *Advanced > Enable ADB*, then on the computer:

```bash
adb root
adb shell 'for p in lk tee gz scp sspm spmfw mcupm dpm pi_img md1img dtbo; do
  dd if=/dev/block/by-name/${p}_a of=/dev/block/by-name/${p}_b bs=1M || exit 1
done; sync; echo done'
```

It must end with `done` and no errors. (If the phone is running slot B, copy B to A
instead.) `vbmeta*` don't need copying: the zip writes them.

## 5. Wipe and install

1. In recovery, choose *Factory reset > Format data/factory reset* and confirm. Stock's
   encrypted data can't be used by LineageOS.
2. Go back, choose *Apply update > Apply from ADB*, then on the computer:

   ```bash
   adb sideload lineage-23.2-<date>-UNOFFICIAL-md07p.zip
   ```

   The computer may stop at about 47 % or print `Total xfer: 1.00x`; that's normal. Wait
   until the phone says the install finished.
3. Go back and choose *Reboot system now*. The first boot takes a few minutes.

## Troubleshooting

- If a sideload fails at postinstall with `Cannot ensure there are no overflow snapshots`,
  stale snapshot state from an interrupted update is left in `/metadata/ota`. From recovery
  with root adb, run `mount /metadata && rm -rf /metadata/ota`, then retry. Do not touch
  `/metadata/vold` (the data encryption key).
- Later Lineage builds install the same way (*Apply from ADB*, no wipe needed). Each update
  switches slots, so the firmware copy in step 4 only has to be done once.
