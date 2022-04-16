#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/soc/soc.ap-ahb/20600000.sdio/by-name/recovery:41943040:8e763a27abd99e1d1421b7042b2a5ad80b50e3a3; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/soc/soc.ap-ahb/20600000.sdio/by-name/boot:36700160:9c72249608318cda516983aabe636e72b6dfebf0 \
          --target EMMC:/dev/block/platform/soc/soc.ap-ahb/20600000.sdio/by-name/recovery:41943040:8e763a27abd99e1d1421b7042b2a5ad80b50e3a3 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
