# OEM Info
BOARD_VENDOR := htc

# Default device path
DEVICE_PATH := device/$(BOARD_VENDOR)/$(TARGET_DEVICE)

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8996
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := $(shell echo $(TARGET_BOOTLOADER_BOARD_NAME) | tr  '[:upper:]' '[:lower:]')
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Kernel
BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyHSL0 \
    androidboot.hardware=htc_pme \
    androidboot.selinux=permissive \
    androidkey.dummy=1 \
    cma=16M@0-0xffffffff \
    console=ttyHSL0,115200,n8 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    user_debug=31
BOARD_KERNEL := recovery:0
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS := \
    --board $(BOARD_KERNEL) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_KERNEL_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3791650816
BOARD_USERDATAIMAGE_PARTITION_SIZE := 469762048
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Encryption
BOARD_USES_QCOM_DECRYPTION := true

# Custom Platform Version and Security Patch
# TWRP Defaults
PLATFORM_VERSION := 20.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31

# SHRP Defaults
SHRP_MAINTAINER := DZZN-DEV
SHRP_DEVICE_CODE := pme
SHRP_PATH := device/htc/$(SHRP_DEVICE_CODE)
SHRP_REC_TYPE := SAR
SHRP_DEVICE_TYPE := A_Only
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_DARK := true
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_HAS_RECOVERY_PARTITION := true
SHRP_NO_SAR_AUTOMOUNT := true
SHRP_LITE := true

# TWRP Build Flags
TW_THEME := portrait_hdpi
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_USE_SYSTEM_VOLD := \
    qseecomd \
    hwservicemanager \
    servicemanager \
    keymaster-3-0
TW_INCLUDE_NTFS_3G := true
TW_OVERRIDE_SYSTEM_PROPS := "ro.build.fingerprint"
#TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_EXFAT_FUSE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_DEVICE_MODULES := android.hidl.base@1.0
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/lib64/android.hidl.base@1.0.so
TW_USE_TOOLBOX := true

# TWRP Debug Flags
#TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
#TARGET_RECOVERY_DEVICE_MODULES += strace
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_OPTIONAL_EXECUTABLES)/strace
#TARGET_RECOVERY_DEVICE_MODULES += twrpdec
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/twrpdec
#TW_CRYPTO_SYSTEM_VOLD_DEBUG := true

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_$(TARGET_DEVICE)
