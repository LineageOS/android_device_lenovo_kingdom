#
# Copyright (C) 2015-2016 The CyanogenMod Project
#           (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from Lenovo msm8974-common
-include device/lenovo/msm8974-common/BoardConfigCommon.mk

DEVICE_PATH := device/lenovo/kingdom

BOARD_VENDOR := lenovo

# Assert compatibility
TARGET_OTA_ASSERT_DEVICE := kingdom,kingdom_row,kingdomt

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

# Kernel
BOARD_KERNEL_CMDLINE := console=tty60,115200,n8 androidboot.hardware=qcom \
                        user_debug=31 msm_rtb.filter=0x3b7 androidboot.bootdevice=msm_sdcc.1 \
			ehci-hcd.park=3 \
			vmalloc=480M \
			androidboot.selinux=permissive

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
TARGET_KERNEL_CONFIG := lineageos_k920_defconfig

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/vnd_kingdom.txt

# Camera
TARGET_USE_VENDOR_CAMERA_EXT := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BACKLIGHT_PATH := "/sys/class/leds/lcd-backlight/brightness"
RED_LED_PATH   := "/sys/class/leds/led:rgb_red/brightness"
GREEN_LED_PATH := "/sys/class/leds/led:rgb_green/brightness"
BLUE_LED_PATH  := "/sys/class/leds/led:rgb_blue/brightness"
BLINK_PATH     := "/sys/class/leds/led:rgb_red/blink"

# Lineage Hardware
BOARD_HARDWARE_CLASS := \
    hardware/lineage/lineagehw \
    $(DEVICE_PATH)/lineagehw

# Tap to wake
TARGET_TAP_TO_WAKE_NODE := "/sys/class/touchscreen/device/gesture"

# Encryption
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE          := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE         := 134217728
BOARD_OEMIMAGE_PARTITION_SIZE           := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE       := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE      := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE        := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE      := 28097608704 # 28097625088 - 16384

# FM
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# GPS
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# GPS HAL
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
TARGET_PROVIDES_GPS_LOC_API := true

# Graphics
TARGET_USE_COMPAT_GRALLOC_PERFORM := true

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Init
TARGET_INIT_VENDOR_LIB := libinit_kingdom
TARGET_RECOVERY_DEVICE_MODULES := libinit_kingdom

# Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_CHIPSET := pn547
BOARD_NFC_DEVICE := /dev/pn547
BOARD_NFC_HAL_SUFFIX := $(TARGET_BOARD_PLATFORM)

# Properties
TARGET_SYSTEM_PROP += device/lenovo/kingdom/system.prop

# Recovery
TARGET_RECOVERY_FSTAB            := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT     := "RGBX_8888"
DEVICE_RESOLUTION                := 1440x2560
RECOVERY_GRAPHICS_USE_LINELENGTH := true
#RECOVERY_VARIANT                 := twrp
RECOVERY_SDCARD_ON_DATA          := true
BOARD_HAS_NO_REAL_SDCARD         := true
TW_INCLUDE_CRYPTO                := true
TW_INCLUDE_FB2PNG                := true
TW_MAX_BRIGHTNESS                := 255
TW_BRIGHTNESS_PATH               := /sys/class/leds/lcd-backlight/brightness

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# Snapdragon LLVM
TARGET_USE_SDCLANG := true

# Inherit from the proprietary version
include vendor/lenovo/kingdom/BoardConfigVendor.mk
