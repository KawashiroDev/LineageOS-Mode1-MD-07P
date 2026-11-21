#!/system/bin/sh
# Run inside TWRP (adb shell sh /tmp/copy-firmware-a-to-b.sh) BEFORE sideloading Lineage.
# Slot B's bootloader/firmware partitions are blank on this phone; the Lineage OTA installs to
# slot B but carries no firmware, so copy slot A's over first.
set -e
for p in lk tee gz scp sspm spmfw mcupm dpm pi_img md1img dtbo; do
  echo "copying ${p}_a -> ${p}_b"
  dd if=/dev/block/by-name/${p}_a of=/dev/block/by-name/${p}_b bs=1M
done
sync
echo done
